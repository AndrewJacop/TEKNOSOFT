import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

import '../../../../utils/helpers/helper_functions.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      borderColor: UtColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(UtSizes.md),
      margin: const EdgeInsets.only(bottom: UtSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with products count
          const BrandCard(showBorder: false),
          SizedBox(height: UtSizes.spaceBtwItems),

          /// Brand top 3 products images
          Row(
            children: images
                .map((e) => brandTopProductImageWidget(e, isDark))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, isDark) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: isDark ? UtColors.darkerGrey : UtColors.light,
        margin: const EdgeInsets.only(right: UtSizes.sm),
        padding: const EdgeInsets.all(UtSizes.sm),
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
