import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/chips/custom_choice_chip.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // SELECTED ATTRIBUTE PRICING AND DESCRIPTION
        RoundedContainer(
          padding: const EdgeInsets.all(UtSizes.md),
          backgroundColor: isDark ? UtColors.darkerGrey : UtColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: UtSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Price : ', smallSize: true),
                          const SizedBox(width: UtSizes.spaceBtwItems),

                          // ACTUAL PRICE
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(width: UtSizes.spaceBtwItems),

                          // SALE PRICE
                          const ProductPriceText(price: '20'),
                        ],
                      ),

                      // STOCK
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // VARIATION DESCRIPTION
              const ProductTitleText(
                title:
                    'This is the description of the product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        const SizedBox(height: UtSizes.spaceBtwItems),

        // ATTRIBUTES
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: UtSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (values) {},
                ),
                CustomChoiceChip(
                  text: 'Blue',
                  selected: true,
                  onSelected: (values) {},
                ),
                CustomChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (values) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: UtSizes.spaceBtwItems / 2),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: UtSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (values) {},
                ),
                const SizedBox(height: UtSizes.spaceBtwItems / 2),
                CustomChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (values) {},
                ),
                const SizedBox(height: UtSizes.spaceBtwItems / 2),
                CustomChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (values) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
