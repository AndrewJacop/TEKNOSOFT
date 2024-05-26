import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/styles/shadows.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/features/shop/controllers/product_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/features/shop/views/product_details/product_details_screen.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;

    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final price = controller.getProductPrice(product);

    /// Container with side paddings, cotor, edges, radius ond shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [UtShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(UtSizes.productImageRadius),
            color: isDark ? UtColors.darkerGrey : UtColors.white),
        child: Column(
          children: [
            /// Thumbnail. wishlist, discount tag
            Center(
              child: RoundedContainer(
                height: 180,
                width: 180,
                padding: const EdgeInsets.all(UtSizes.sm),
                backgroundColor: isDark ? UtColors.dark : UtColors.light,
                child: Stack(
                  children: [
                    /// Thumbnail
                    RoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),

                    /// Discount tag
                    Positioned(
                      top: 12,
                      child: RoundedContainer(
                        radius: UtSizes.sm,
                        backgroundColor: UtColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: UtSizes.sm, vertical: UtSizes.xs),
                        child: Text(
                          "$salePercentage%",
                          style: Theme.of(context).textTheme.labelLarge!.apply(color: UtColors.black),
                        ),
                      ),
                    ),

                    /// Favorits icon button
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(icon: Iconsax.heart5, color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwItems / 2),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: UtSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: UtSizes.spaceBtwItems / 2),
                  BrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),
            // Use Spacer() to utilize att the space to set the price and the cart button at the bottom.
            // This usually happens when Product title is in single line or 2 lines (Max)
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: UtSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: UtSizes.sm),
                        child: ProductPriceText(price: '\$$price'),
                      ),
                    ],
                  ),
                ),

                /// Add to Card Button
                Container(
                  decoration: const BoxDecoration(
                      color: UtColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(UtSizes.cardRadiusMd),
                        bottomRight: Radius.circular(UtSizes.productImageRadius),
                      )),
                  child: const SizedBox(
                      width: UtSizes.iconLg * 1.2,
                      height: UtSizes.iconLg * 1.2,
                      child: Center(child: Icon(Iconsax.add, color: UtColors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
