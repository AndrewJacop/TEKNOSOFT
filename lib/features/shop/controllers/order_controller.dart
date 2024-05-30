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

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch User's Order History
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      UtLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  /// Method for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      UtFullScreenLoader.openLoadingDialog("Processing your order", UtImages.pencilAnimation);

      // Get user authentication id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add details
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

      // Save the order to the firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Remove loader
      UtFullScreenLoader.stopLoading();

      // Show Success Screen
      Get.off(() => SuccessScreen(
            image: UtImages.orderCompletedAnimation,
            title: "Payment Success!",
            subTitle: "Your item will be shipped soon",
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      // Remove loader
      UtFullScreenLoader.stopLoading();
      // Show Error Message
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
