import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/controllers/category_controller.dart';
import 'package:flutter_t_store/features/shop/models/category_model.dart';
import 'package:flutter_t_store/features/shop/views/all_products/all_products_screen.dart';
import 'package:flutter_t_store/features/shop/views/store/widgets/category_brands.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
      Padding(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Brands
            CategoryBrands(category: category),
            const SizedBox(height: UtSizes.spaceBtwItems),

            /// -- Products
            FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (_, snapshot) {
                  // Handle Loader, No Records, or Error Message
                  const loader = VerticalProductShimmer();
                  final widget = UtCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  // Records Fount
                  final products = snapshot.data!;
                  return Column(
                    children: [
                      SectionHeading(
                          title: "You might like",
                          onPressed: () => Get.to(
                                () => AllProductsScreen(
                                  title: category.name,
                                  futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                                ),
                              )),
                      const SizedBox(height: UtSizes.spaceBtwItems),
                      GridLayout(
                          itemCount: 4, itemBuilder: (_, index) => VerticalProductCard(product: products[index])),
                    ],
                  );
                })
          ],
        ),
      ),
    ]);
  }
}
