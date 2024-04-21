import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/bottum_add_to_cart.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/product_attributes.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/product_image_slider.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/product_meta_data.dart';
import 'package:flutter_t_store/features/shop/views/product_details/widgets/rating_and_share.dart';
import 'package:flutter_t_store/features/shop/views/product_review/product_review_screen.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            const ProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: UtSizes.defaultSpace,
                  left: UtSizes.defaultSpace,
                  bottom: UtSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const RatingAndShare(),

                  /// Price, titel, Stock & Brand
                  const ProductMetaData(),

                  /// Atributes
                  const ProductAttributes(),
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
                  const ReadMoreText(
                    'This is a Product description for blue nike shoes. There are moe things that can be added but i am not adding them here , you can check them out on our official website.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
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
                        onPressed: () =>
                            {Get.to(() => const ProductReviewScreen())},
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
