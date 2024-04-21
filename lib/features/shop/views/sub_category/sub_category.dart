import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/products/cards/horizontal_product_card.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              // BANNER
              const RoundedImage(
                width: double.infinity,
                imageUrl: UtImages.promoBanner3,
                applyImageRadius: true,
              ),

              const SizedBox(height: UtSizes.spaceBtwSections),

              // SUB-CATEGORIES
              Column(
                children: [
                  //HEADING
                  SectionHeading(title: 'Sports Shirt', onPressed: () {}),

                  const SizedBox(height: UtSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: UtSizes.spaceBtwItems,
                      ),
                      itemBuilder: (context, index) =>
                          const HorizontalProductCard(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
