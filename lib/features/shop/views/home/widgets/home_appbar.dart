import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/loaders/shimmer.dart';
import 'package:flutter_t_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_t_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_t_store/features/shop/views/cart/cart_screen.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      actions: [CartCounterIcon(onPressed: () => Get.to(() => const CartScreen()), iconColor: UtColors.white)],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(UtTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: UtColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer loader while user profile is loading
              return const ShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: UtColors.white));
            }
          }),
        ],
      ),
    );
  }
}
