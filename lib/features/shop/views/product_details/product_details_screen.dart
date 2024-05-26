import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/bottum_add_to_cart.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/product_attributes.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/product_image_slider.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/product_meta_data.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/rating_and_share.dart';
import 'package:flutter_t_store/features/shop/views/product_review/product_review_screen.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            ProductImageSlider(product: product),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: UtSizes.defaultSpace, left: UtSizes.defaultSpace, bottom: UtSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const RatingAndShare(),

                  /// Price, titel, Stock & Brand
                  ProductMetaData(product: product),

                  /// Atributes
                  if (product.productType == ProductType.variable.toString()) ProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: UtSizes.spaceBtwSections),

                  // CHECKOUT BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: UtSizes.spaceBtwSections),

                  // DESCRIPTION
                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: UtSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // REVIEWS
                  const Divider(),
                  const SizedBox(height: UtSizes.spaceBtwItems),
                  Row(
                    children: [
                      SectionHeading(
                        title: 'Reviews (199)',
                        onPressed: () {},
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => {Get.to(() => const ProductReviewScreen())},
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: UtSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
