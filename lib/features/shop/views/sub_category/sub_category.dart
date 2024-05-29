import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/products/cards/horizontal_product_card.dart';
import 'package:flutter_t_store/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/controllers/category_controller.dart';
import 'package:flutter_t_store/features/shop/models/category_model.dart';
import 'package:flutter_t_store/features/shop/views/all_products/all_products_screen.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(category.name, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const RoundedImage(width: double.infinity, imageUrl: UtImages.promoBanner3, applyImageRadius: true),

              const SizedBox(height: UtSizes.spaceBtwSections),

              // Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (_, snapshot) {
                    // Handle Loader, No Records, or Error Message
                    const loader = HorizontalProductShimmer();
                    final widget = UtCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Records Found
                    final subCategories = snapshot.data!;
                    return ListView.builder(
                      itemCount: subCategories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              // Handle Loader, No Records, or Error Message
                              final widget =
                                  UtCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              // Records Found
                              final products = snapshot.data!;
                              return Column(
                                children: [
                                  // Heading
                                  SectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(() => AllProductsScreen(
                                          title: subCategory.name,
                                          futureMethod:
                                              controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                        )),
                                  ),
                                  const SizedBox(height: UtSizes.spaceBtwItems / 2),

                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: subCategories.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (_, __) => const SizedBox(width: UtSizes.spaceBtwItems),
                                      itemBuilder: (_, index) => HorizontalProductCard(product: products[index]),
                                    ),
                                  ),
                                  const SizedBox(height: UtSizes.spaceBtwSections),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
