import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price $ Sale Price
        Row(
          children: [
            // sale tage
            RoundedContainer(
              radius: UtSizes.sm,
              backgroundColor: UtColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: UtSizes.sm, vertical: UtSizes.xs),
              child: Text("25%",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: UtColors.black)),
            ),
            const SizedBox(width: UtSizes.spaceBtwItems),

            /// Price
            Text("\$250",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: UtSizes.spaceBtwItems),

            /// Sale Price
            const ProductPriceText(price: "175", isLarge: true)
          ],
        ),
        const SizedBox(height: UtSizes.spaceBtwItems / 1.5),

        /// Title
        const ProductTitleText(title: "Green Nike Sports Shirt"),
        const SizedBox(height: UtSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: "Status"),
            const SizedBox(width: UtSizes.spaceBtwItems / 1.5),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: UtSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              image: UtImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: isDark ? UtColors.white : UtColors.black,
            ),
            const BrandTitleTextWithVerifiedIcon(
                title: "Nike", brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
