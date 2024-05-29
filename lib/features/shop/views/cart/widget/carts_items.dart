import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_t_store/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/features/shop/controllers/cart_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemovebutton = true});

  final bool showAddRemovebutton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: UtSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = controller.cartItems[index];
          return Column(
            children: [
              // Cart Item
              CartItem(cartItem: item),

              if (showAddRemovebutton) const SizedBox(height: UtSizes.spaceBtwItems),

              // Add and Remove Button with Price
              if (showAddRemovebutton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),

                        // Add, Remove Buttons
                        ProductQuantityWithAddRemoveButtons(
                          quantity: item.quantity,
                          add: () => controller.itemPlusOneToCart(item),
                          remove: () => controller.itemMinusOneFromCart(item),
                        ),
                      ],
                    ),

                    // Product Price Text
                    ProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      );
    });
  }
}
