import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/features/shop/views/checkout/checkout_screen.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'widget/carts_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(UtSizes.defaultSpace),

        // ITEMS IN THE CART
        child: CartItems(),
      ),

      // CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout \$256'),
        ),
      ),
    );
  }
}
