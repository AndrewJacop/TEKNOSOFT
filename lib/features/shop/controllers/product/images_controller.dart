import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  final RxString selectedProductImage = ''.obs;

  /// Get all images for product and variations
  List<String> getAllProductImages(ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // Assign thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // // Get all images from  Product model if not null
    // if (product.images != null) images.addAll(product.images!);

    // // Get all images from  product variations if not null
    // if (product.productVariations != null || product.productVariations!.isNotEmpty) {
    //   images.addAll(product.productVariations!.map((variation) => variation.image));
    // }

    // Get all images from  Product model if not null
    if (product.productType == ProductType.single.toString()) {
      if (product.images != null) {
        images.addAll(product.images!);
      }
    } else {
      // Get all images from  product variations if not null
      if (product.productVariations != null || product.productVariations!.isNotEmpty) {
        images.addAll(product.productVariations!.map((variation) => variation.image));
      }
    }
    return images.toList();
  }

  /// Show Image Popup
  void showEnlargeImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: UtSizes.defaultSpace * 2, horizontal: UtSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: UtSizes.spaceBtwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150.0,
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: Text("Close", style: Theme.of(Get.context!).textTheme.titleMedium),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
