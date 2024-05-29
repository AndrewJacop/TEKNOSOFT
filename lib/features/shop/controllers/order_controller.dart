import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/data/repositories/order/order_repository.dart';
import 'package:flutter_t_store/features/personalization/controllers/address_controller.dart';
import 'package:flutter_t_store/features/shop/controllers/cart_controller.dart';
import 'package:flutter_t_store/features/shop/controllers/checkout_controller.dart';
import 'package:flutter_t_store/features/shop/models/order_model.dart';
import 'package:flutter_t_store/navigation_menu.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      UtLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      UtFullScreenLoader.openLoadingDialog("Processing your order", UtImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();
      UtFullScreenLoader.stopLoading();
      Get.off(() => SuccessScreen(
            image: UtImages.orderCompletedAnimation,
            title: "Payment Success!",
            subTitle: "Your item will be shipped soon",
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      UtFullScreenLoader.stopLoading();

      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
