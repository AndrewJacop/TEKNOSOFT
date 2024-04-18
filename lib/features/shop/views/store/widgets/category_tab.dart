import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_showcase.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(UtSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Brands
                BrandShowcase(images: [
                  UtImages.productImage1,
                  UtImages.productImage2,
                  UtImages.productImage3,
                ]),
                BrandShowcase(images: [
                  UtImages.productImage1,
                  UtImages.productImage2,
                  UtImages.productImage3,
                ]),
                SizedBox(height: UtSizes.spaceBtwItems),

                /// -- Products
                SectionHeading(title: "You might like", onPressed: () {}),
                SizedBox(height: UtSizes.spaceBtwItems),

                GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => VerticalProductCard())
              ],
            ),
          ),
        ]);
  }
}
