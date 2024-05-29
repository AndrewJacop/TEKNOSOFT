import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/shop/controllers/cart_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/features/shop/views/product_details/product_details_screen.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        // If the product have variations then show the product Details for variation selection.
        // Else add product to the cart.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = controller.convertToCartItem(product, 1);
          controller.itemPlusOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = controller.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? UtColors.primary : UtColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(UtSizes.cardRadiusMd),
                bottomRight: Radius.circular(UtSizes.productImageRadius),
              )),
          child: SizedBox(
              width: UtSizes.iconLg * 1.2,
              height: UtSizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(productQuantityInCart.toString(),
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: UtColors.white))
                      : const Icon(Iconsax.add, color: UtColors.white))),
        );
      }),
    );
  }
}
