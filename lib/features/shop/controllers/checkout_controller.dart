import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/list_tiles/payment_tile.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/models/payment_method_model.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: "Paypal", image: UtImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(UtSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeading(title: "Select Payment Method", showActionButton: false),
                    const SizedBox(height: UtSizes.spaceBtwSections),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "Paypal", image: UtImages.paypal)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "Google Pay", image: UtImages.googlePay)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "Apple Pay", image: UtImages.applePay)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "VISA", image: UtImages.visa)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "Master Card", image: UtImages.masterCard)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "Paytm", image: UtImages.paytm)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "Paystack", image: UtImages.paystack)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    PaymentTile(paymentMethod: PaymentMethodModel(name: "Credit Card", image: UtImages.creditCard)),
                    const SizedBox(height: UtSizes.spaceBtwItems / 2),
                    const SizedBox(height: UtSizes.spaceBtwSections)
                  ],
                ),
              ),
            ));
  }
}
