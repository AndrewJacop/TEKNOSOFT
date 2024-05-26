import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/chips/custom_choice_chip.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());

    return Obx(() => Column(
          children: [
            /// -- Selected Attributes Pricing and Description
            // Display variation price and stock when some variation is selected
            if (controller.selectedVariation.value.id.isNotEmpty)
              RoundedContainer(
                padding: const EdgeInsets.all(UtSizes.md),
                backgroundColor: isDark ? UtColors.darkerGrey : UtColors.grey,
                child: Column(
                  children: [
                    /// Title, Price and Stock status
                    Row(
                      children: [
                        const SectionHeading(title: 'Variation', showActionButton: false),
                        const SizedBox(width: UtSizes.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const ProductTitleText(title: 'Price : ', smallSize: true),
                                const SizedBox(width: UtSizes.spaceBtwItems),

                                // ACTUAL PRICE
                                if (controller.selectedVariation.value.salePrice > 0)
                                  Text(
                                    '\$${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(decoration: TextDecoration.lineThrough),
                                  ),

                                if (controller.selectedVariation.value.salePrice > 0)
                                  const SizedBox(width: UtSizes.spaceBtwItems),

                                // SALE PRICE
                                ProductPriceText(price: controller.getVariationPrice()),
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
                                  controller.variationStockStatus(),
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    // VARIATION DESCRIPTION
                    ProductTitleText(
                      title: controller.selectedVariation.value.description ?? '',
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
              children: product.productAttributes!.map((attribute) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(title: attribute.name ?? '', showActionButton: false),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    Obx(() => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final isAvailable = controller
                                .getAttributesAvailabilityInVariations(product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return CustomChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: isAvailable
                                  ? (selected) {
                                      if (selected && isAvailable) {
                                        controller.onAttributesSelected(product, attribute.name ?? '', attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        )),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: UtSizes.spaceBtwItems / 2),
          ],
        ));
  }
}
