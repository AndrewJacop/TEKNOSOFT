import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/features/shop/models/brand_model.dart';
import 'package:flutter_t_store/features/shop/views/brands/brand_products_screen.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: UtColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(UtSizes.md),
        margin: const EdgeInsets.only(bottom: UtSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with products count
            BrandCard(showBorder: false, brand: brand, imageSize: 50.0),
            const SizedBox(height: UtSizes.spaceBtwItems),

            /// Brand top 3 products images
            Row(children: images.map((e) => BrandTopProductImageWidget(image: e, isDark: isDark)).toList())
          ],
        ),
      ),
    );
  }
}

class BrandTopProductImageWidget extends StatelessWidget {
  const BrandTopProductImageWidget({super.key, required this.image, required this.isDark});

  final String image;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: isDark ? UtColors.darkerGrey : UtColors.light,
        margin: const EdgeInsets.only(right: UtSizes.sm),
        padding: const EdgeInsets.all(UtSizes.sm),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (_, __, ___) => const ShimmerEffect(width: 100, height: 100),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
