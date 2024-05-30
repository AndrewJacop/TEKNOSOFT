import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/features/shop/controllers/order_controller.dart';
import 'package:flutter_t_store/navigation_menu.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/device/device_utility.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());

    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          // Nothing-found Widget
          final emptyWidget = AnimationLoaderWidget(
            text: "Whoops! No orders yet!",
            animation: UtImages.orderCompletedAnimation,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.to(() => const NavigationMenu()),
          );

          // Handle loader, No Records, or Error Messeges
          final loader = Column(
            children: [
              ShimmerEffect(width: UtDeviceUtils.getScreenWidth(context) - 30.0, height: 120.0),
              const SizedBox(height: UtSizes.spaceBtwItems),
              ShimmerEffect(width: UtDeviceUtils.getScreenWidth(context) - 30.0, height: 120.0),
            ],
          );
          final widget = UtCloudHelperFunctions.checkMultiRecordState(
              loader: loader, snapshot: snapshot, nothingFound: emptyWidget);
          if (widget != null) return widget;

          // Records Found
          final orders = snapshot.data!;
          return ListView.separated(
              itemCount: orders.length,
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(height: UtSizes.spaceBtwItems),
              itemBuilder: (_, index) {
                final order = orders[index];
                return RoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(UtSizes.md),
                  backgroundColor: isDark ? UtColors.dark : UtColors.light,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Top Row
                      Row(
                        children: [
                          // Image
                          const Icon(Iconsax.ship),
                          const SizedBox(width: UtSizes.spaceBtwItems),
                          // Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.orderStatusText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: UtColors.primary, fontWeightDelta: 1),
                                ),
                                Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall)
                              ],
                            ),
                          ),
                          IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: UtSizes.iconSm))
                        ],
                      ),
                      const SizedBox(height: UtSizes.spaceBtwItems),
                      // Buttom Row
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                // Image
                                const Icon(Iconsax.tag),
                                const SizedBox(width: UtSizes.spaceBtwItems),

                                // Status & Date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Order", style: Theme.of(context).textTheme.labelMedium),
                                      Text(order.id, style: Theme.of(context).textTheme.titleMedium)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                // Icon
                                const Icon(Iconsax.calendar),
                                const SizedBox(width: UtSizes.spaceBtwItems),

                                // Status and Date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Shipping Date", style: Theme.of(context).textTheme.labelMedium),
                                      Text(order.formattedDeliveryDate, style: Theme.of(context).textTheme.titleMedium)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
