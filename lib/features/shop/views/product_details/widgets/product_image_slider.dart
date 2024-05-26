import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/features/shop/controllers/product/images_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());

    final images = controller.getAllProductImages(product);

    return CurvedEdgeWidget(
        child: Container(
      color: isDark ? UtColors.darkerGrey : UtColors.light,
      child: Stack(
        children: [
          /// Main Large Image
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(UtSizes.productImageRadius * 2),
              child: Center(
                child: Obx(
                  () {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargeImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress, color: UtColors.primary),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          /// Image slider
          Positioned(
            right: 0,
            bottom: 30,
            left: UtSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: UtSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(() {
                        final imageSelected = controller.selectedProductImage.value == images[index];
                        return RoundedImage(
                          onPressed: () => controller.selectedProductImage.value = images[index],
                          isNetworkImage: true,
                          width: 80,
                          imageUrl: images[index],
                          backgroundColor: isDark ? UtColors.dark : UtColors.white,
                          border: Border.all(color: imageSelected ? UtColors.primary : Colors.transparent),
                          padding: const EdgeInsets.all(UtSizes.sm),
                        );
                      })),
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
