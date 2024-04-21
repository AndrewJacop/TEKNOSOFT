import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/styles/shadows.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/features/shop/views/product_details/product_details_screen.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);

    /// Container with side paddings, cotor, edges, radius ond shadow.
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailsScreen()),
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
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(UtSizes.sm),
              backgroundColor: isDark ? UtColors.dark : UtColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  const RoundedImage(
                    imageUrl: UtImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// Discount tag
                  Positioned(
                      top: 12,
                      child: RoundedContainer(
                        radius: UtSizes.sm,
                        backgroundColor: UtColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: UtSizes.sm, vertical: UtSizes.xs),
                        child: Text("25%",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: UtColors.black)),
                      )),

                  /// Favorits icon button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwItems / 2),

            ///Details
            const Padding(
              padding: EdgeInsets.only(left: UtSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                      title: "Green Nike Air Shoes", smallSize: true),
                  SizedBox(height: UtSizes.spaceBtwItems / 2),
                  BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: UtSizes.sm),
                  child: ProductPriceText(price: "35.5"),
                ),

                /// Add to Card Button
                Container(
                  decoration: const BoxDecoration(
                      color: UtColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(UtSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(UtSizes.productImageRadius),
                      )),
                  child: const SizedBox(
                      width: UtSizes.iconLg * 1.2,
                      height: UtSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: UtColors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
