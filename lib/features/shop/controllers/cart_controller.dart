import 'package:flutter/widgets.dart';
import 'package:flutter_t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_t_store/features/shop/models/cart_item_model.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/local_storage/storage_utility.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  /// Constructer
  CartController() {
    loadCartItems();
  }

  /// Add items in the cart
  void addToCart(ProductModel product) {
    // Quantity check
    if (productQuantityInCart.value < 1) {
      UtLoaders.customToast(message: "Select Quantity");
      return;
    }

    // Variation Stelected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      UtLoaders.customToast(message: "Select Varation");
      return;
    }

    // Out of stock status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        UtLoaders.warningSnackBar(title: "Oh Snap!", message: "Selected Variation is out of stock");
        return;
      } else {
        if (product.stock < 1) {
          UtLoaders.warningSnackBar(title: "Oh Snap!", message: "Selected Products is out of stock");
          return;
        }
      }
    }

    // Convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // This quantity is already added or updated/removed from Cart
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      // Add item to cart
      cartItems.add(selectedCartItem);
    }

    // Update cart
    updateCart();

    // Show success message
    UtLoaders.customToast(message: "Your product has been added to the cart");
  }

  void itemPlusOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void itemMinusOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show dialog before completely removing the item from cart
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
        textConfirm: "Remove",
        buttonColor: UtColors.primary,
        titlePadding: const EdgeInsets.only(top: 15),
        contentPadding: const EdgeInsets.all(15),
        title: "Remove Product",
        middleText: "Are you sure you want to remove this product?",
        onConfirm: () {
          // Remove item fom the cart
          cartItems.removeAt(index);
          updateCart();
          UtLoaders.customToast(message: "Product removed from the cart.");
          Get.back();
        },
        onCancel: () => () => Get.back());
  }

  /// This function converts a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price,
        quantity: quantity,
        variationId: variation.id,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : "",
        selectedVariation: isVariation ? variation.attributeValues : null);
  }

  /// Update cart values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  /// Update the number of Items in cart and the total price
  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  /// Save cart items in local storage
  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    UtLocalStorage.instance().writeData("cartItems", cartItemStrings);
  }

  /// Load cart items from local storage
  void loadCartItems() {
    final cartItemStrings = UtLocalStorage.instance().readData<List<dynamic>>("cartItems");
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final int foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final CartItemModel foundItem = cartItems.firstWhere(
        (item) => item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    // If Product has no variation then calculate cart Entries and display Total Number
    // Else make default entries to 0 and show cart Entries when variation is selected
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Get selected variation if any
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
