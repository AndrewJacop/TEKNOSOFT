import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_t_store/features/shop/controllers/cart_controller.dart';
import 'package:flutter_t_store/features/shop/views/checkout/checkout_screen.dart';
import 'package:flutter_t_store/navigation_menu.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import 'widget/carts_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = AnimationLoaderWidget(
          text: "Whoops! Cart is Empty...",
          animation: UtImages.pencilAnimation,
          showAction: true,
          actionText: "Let's fill it",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        return (controller.cartItems.isEmpty)
            ? emptyWidget
            : const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(UtSizes.defaultSpace),

                  // ITEMS IN THE CART
                  child: CartItems(),
                ),
              );
      }),

      // CHECKOUT BUTTON

      bottomNavigationBar: (controller.cartItems.isEmpty)
          ? null
          : Padding(
              padding: const EdgeInsets.all(UtSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Text('Checkout \$${controller.totalCartPrice.value}'),
              ),
            ),
    );
  }
}
