import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class CartsItem extends StatelessWidget {
  const CartsItem({
    super.key,
    this.showAddRemovebutton = true,
  });

  final bool showAddRemovebutton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: UtSizes.spaceBtwSections),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          // Cart Item
          const CartsItem(),

          if (showAddRemovebutton)
            const SizedBox(height: UtSizes.spaceBtwItems),

          // ADD AND REMOVE BUTTON WITH PRICE
          if (showAddRemovebutton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),

                    // ADD REMOVE BUTTON
                    ProductQuantityWithAddRemove(),
                  ],
                ),

                // PRODUCT PRICE TEXT
                ProductPriceText(price: '250'),
              ],
            ),
        ],
      ),
    );
  }
}
