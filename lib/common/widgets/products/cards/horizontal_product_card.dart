import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UtSizes.productImageRadius),
        color: isDark ? UtColors.darkerGrey : UtColors.lightContainer,
      ),
      child: Row(
        children: [
          // THUMBNAIL
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(UtSizes.sm),
            backgroundColor: isDark ? UtColors.dark : UtColors.light,
            child: Stack(
              children: [
                // THUMBNAIL IMAGE
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                    imageUrl: UtImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                // SALE TAG
                Positioned(
                  top: 12,
                  child: RoundedContainer(
                    radius: UtSizes.sm,
                    backgroundColor: UtColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: UtSizes.sm,
                      vertical: UtSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: UtColors.black),
                    ),
                  ),
                ),

                // FAVORITE ICON BUTTON
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          // DETAILS
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: UtSizes.sm, left: UtSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITLE
                      ProductTitleText(
                        title: 'Green Nike Shoe',
                        smallSize: true,
                      ),
                      SizedBox(height: UtSizes.spaceBtwItems / 2),
                      BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // PRICING
                      const Flexible(
                        child: ProductPriceText(price: '99'),
                      ),

                      // ADD TO CART
                      Container(
                        decoration: const BoxDecoration(
                          color: UtColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(UtSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(UtSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: UtSizes.iconLg * 1.2,
                          height: UtSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: UtColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
