import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_showcase.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/models/category_model.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
      Padding(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Brands
            const BrandShowcase(images: [
              UtImages.productImage1,
              UtImages.productImage2,
              UtImages.productImage3,
            ]),
            const BrandShowcase(images: [
              UtImages.productImage1,
              UtImages.productImage2,
              UtImages.productImage3,
            ]),
            const SizedBox(height: UtSizes.spaceBtwItems),

            /// -- Products
            SectionHeading(title: "You might like", onPressed: () {}),
            const SizedBox(height: UtSizes.spaceBtwItems),

            GridLayout(itemCount: 4, itemBuilder: (_, index) => VerticalProductCard(product: ProductModel.empty()))
          ],
        ),
      ),
    ]);
  }
}
