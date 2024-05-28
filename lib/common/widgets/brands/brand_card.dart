import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/features/shop/models/brand_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

import '../../../../utils/helpers/helper_functions.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
    this.fit = BoxFit.cover,
    this.imageSize = 40.0,
  });

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;
  final BoxFit fit;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(UtSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // -- Icon
            Flexible(
              child: CircularImage(
                fit: fit,
                image: brand.image,
                height: imageSize,
                width: imageSize,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: (isDark ? UtColors.white : UtColors.black),
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwItems / 2),

            // -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleTextWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    "${brand.productsCount ?? 0} products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
