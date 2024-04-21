import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/products/cart/coupon_code.dart';
import 'package:flutter_t_store/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_t_store/features/shop/views/cart/widget/carts_items.dart';
import 'package:flutter_t_store/navigation_menu.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'widget/billing_address_section.dart';
import 'widget/billing_amount_section.dart';
import 'widget/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title:
            Text('Checkout', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              // ITEMS IN THE CART
              const CartsItem(showAddRemovebutton: false),
              const SizedBox(height: UtSizes.spaceBtwSections),

              // COUPON TEXTFIELD
              const CouponCode(),
              const SizedBox(height: UtSizes.spaceBtwSections),

              // Billing Section
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(UtSizes.md),
                backgroundColor: isDark ? UtColors.black : UtColors.white,
                child: const Column(
                  children: [
                    // PRICING
                    BillingAmountSection(),
                    SizedBox(height: UtSizes.spaceBtwItems),

                    // DIVIDER
                    Divider(),
                    SizedBox(height: UtSizes.spaceBtwItems),

                    // PAYMENT METHODS
                    BillingPaymentSection(),
                    SizedBox(height: UtSizes.spaceBtwItems),

                    // ADDRESS
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: UtImages.successfulPaymentIcon,
              title: 'Payment Success',
              subTitle: 'Your Item will be Shipped sson!!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout \$256'),
        ),
      ),
    );
  }
}
