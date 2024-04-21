import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // IMAGE
        RoundedImage(
          imageUrI: UtImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(UtSizes.sm),
          backgroundColor: darkMode ? UtColors.darkerGrey : UtColors.light,
        ),

        const SizedBox(width: UtSizes.spaceBtwItems),

        // TITLE, PRICE, SIZE
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextWithVerifiedIcon(title: 'Nike'),

              const Flexible(
                child: ProductTitleText(
                  title: 'Green Sports Shoes',
                  maxLines: 1,
                ),
              ),

              // ATTRIBUTES
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Colors',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 09',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
