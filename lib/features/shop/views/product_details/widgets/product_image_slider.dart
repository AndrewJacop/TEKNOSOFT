import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
        child: Container(
      color: isDark ? UtColors.darkerGrey : UtColors.light,
      child: Stack(
        children: [
          /// Main Large Image
          const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(UtSizes.productImageRadius * 2),
                child: Center(
                    child: Image(image: AssetImage(UtImages.productImage5))),
              )),

          /// Image slider
          Positioned(
            right: 0,
            bottom: 30,
            left: UtSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) =>
                    const SizedBox(width: UtSizes.spaceBtwItems),
                itemBuilder: (_, index) => RoundedImage(
                  width: 80,
                  imageUrI: UtImages.productImage6,
                  backgroundColor: isDark ? UtColors.dark : UtColors.white,
                  border: Border.all(color: UtColors.primary),
                  padding: const EdgeInsets.all(UtSizes.sm),
                ),
              ),
            ),
          ),

          /// Appbar Icons
          const CustomAppBar(
            showBackArrow: true,
            actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red)],
          )
        ],
      ),
    ));
  }
}
