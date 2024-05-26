import 'package:flutter_t_store/features/authentication/views/login/login_screen.dart';
import 'package:flutter_t_store/features/authentication/views/onboarding/onboarding_screen.dart';
import 'package:flutter_t_store/features/authentication/views/password/forgot_password_screen.dart';
import 'package:flutter_t_store/features/authentication/views/signup/signup_screen.dart';
import 'package:flutter_t_store/features/authentication/views/signup/verify_email_screen.dart';
import 'package:flutter_t_store/features/personalization/views/address/address_screen.dart';
import 'package:flutter_t_store/features/personalization/views/profile/profile_screen.dart';
import 'package:flutter_t_store/features/personalization/views/settings/settings_screen.dart';
import 'package:flutter_t_store/features/shop/views/cart/cart_screen.dart';
import 'package:flutter_t_store/features/shop/views/checkout/checkout_screen.dart';
import 'package:flutter_t_store/features/shop/views/home/home_screen.dart';
import 'package:flutter_t_store/features/shop/views/orders/orders_screen.dart';
import 'package:flutter_t_store/features/shop/views/product_review/product_review_screen.dart';
import 'package:flutter_t_store/features/shop/views/store/store_screen.dart';
import 'package:flutter_t_store/features/shop/views/wishlist/wishlist_screen.dart';
import 'package:flutter_t_store/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: UtRoutes.home, page: () => const HomeScreen()),
    GetPage(name: UtRoutes.store, page: () => const StoreScreen()),
    GetPage(name: UtRoutes.favourites, page: () => const WishlistScreen()),
    GetPage(name: UtRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: UtRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: UtRoutes.order, page: () => const OrdersScreen()),
    GetPage(name: UtRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: UtRoutes.cart, page: () => const CartScreen()),
    GetPage(name: UtRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: UtRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: UtRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: UtRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: UtRoutes.signin, page: () => const LoginScreen()),
    GetPage(name: UtRoutes.forgetPassword, page: () => const ForgetPasswordSceen()),
    GetPage(name: UtRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
