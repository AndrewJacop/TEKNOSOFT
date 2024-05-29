import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/features/shop/controllers/cart_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: UtSizes.defaultSpace, vertical: UtSizes.defaultSpace / 2),
        decoration: BoxDecoration(
          color: isDark ? UtColors.darkerGrey : UtColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(UtSizes.cardRadiusLg),
            topRight: Radius.circular(UtSizes.cardRadiusLg),
          ),
        ),
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: UtColors.darkGrey,
                    width: 40,
                    height: 40,
                    color: UtColors.white,
                    onPressed: controller.getProductQuantityInCart(product.id) < 1
                        ? null
                        : () => controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(width: UtSizes.spaceBtwItems),
                  Text('2', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: UtSizes.spaceBtwItems),
                  CircularIcon(
                    icon: Iconsax.add,
                    backgroundColor: UtColors.black,
                    width: 40,
                    height: 40,
                    color: UtColors.white,
                    onPressed: () => controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(UtSizes.md),
                  backgroundColor: UtColors.black,
                  side: const BorderSide(color: Colors.black),
                ),
                child: const Text('Add to Cart'),
              ),
            ],
          );
        }));
  }
}
