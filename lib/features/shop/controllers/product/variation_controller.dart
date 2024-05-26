import 'package:flutter_t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_t_store/features/shop/controllers/product/images_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = "".obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Select Attribute and Variation
  void onAttributesSelected(ProductModel product, attributeName, attributeValue) {
    // When attribute is sellected, we will first add that attribute to selectedAttribute
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Show the selected Variation image as a main Image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }
    // Show the selected variation quantity already in the cart
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value =
          cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign Selevted Variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  /// Check if selected attributes match any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    // If seslectedAttributes contains 3 attributes and current variation contains 2 then return false
    if (variationAttributes.length != selectedAttributes.length) return false;

    //If any of the attributes is different then return e.g. [Green, Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attribute[Key] = Value which oculd be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price)
        .toString();
  }

  /// Check attribute availabiltiy / stock in variation
  Set<String?> getAttributesAvailabilityInVariations(List<ProductVariationModel> variations, String attributeName) {
    // Pass the variation to check which attributes are available and stock is not0
    final availableVaraiationAttributeValues = variations
        .where(
          (variation) =>
              // Check empty / out of stock attributes
              variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stock > 0,
        )
        // Fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVaraiationAttributeValues;
  }

  /// Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  /// Reset Slected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = "";
    selectedVariation.value = ProductVariationModel.empty();
  }
}
