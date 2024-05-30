import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/products/cart/coupon_code.dart';
import 'package:flutter_t_store/features/shop/controllers/cart_controller.dart';
import 'package:flutter_t_store/features/shop/controllers/order_controller.dart';
import 'package:flutter_t_store/features/shop/views/cart/widget/carts_items.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:flutter_t_store/utils/helpers/pricing_calculator.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import 'widget/billing_address_section.dart';
import 'widget/billing_amount_section.dart';
import 'widget/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final totalAmount = UtPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final orderController = Get.put(OrderController());

    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Checkout', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              // Items in the Cart
              const CartItems(showAddRemovebutton: false),
              const SizedBox(height: UtSizes.spaceBtwSections),

              // Cuopon Textfield
              const CouponCode(),
              const SizedBox(height: UtSizes.spaceBtwSections),

              // Billing Section
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(UtSizes.md),
                backgroundColor: isDark ? UtColors.black : UtColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    BillingAmountSection(),
                    SizedBox(height: UtSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: UtSizes.spaceBtwItems),

                    // Payment Method
                    BillingPaymentSection(),
                    SizedBox(height: UtSizes.spaceBtwItems),

                    // Address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () =>
                  UtLoaders.warningSnackBar(title: "Empty Cart", message: "Add items in the cart in order to proceed."),
          child: Text('Checkout \$$totalAmount'),
        ),
      ),
    );
  }
}
