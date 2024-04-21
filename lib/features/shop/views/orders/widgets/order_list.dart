import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: UtSizes.spaceBtwItems,
      ),
      itemCount: 3,
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        backgroundColor: isDark ? UtColors.dark : UtColors.light,
        padding: const EdgeInsets.all(UtSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ROW-1
            Row(
              children: [
                // ICON
                const Icon(Iconsax.ship),
                const SizedBox(width: UtSizes.spaceBtwItems / 2),

                //STATUS AND DATE
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: UtColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '07 Jan 2024',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                // ICON
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Iconsax.arrow_right_34, size: UtSizes.iconSm),
                ),
              ],
            ),

            const SizedBox(height: UtSizes.spaceBtwItems),

            // ROW-2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // ICON
                      const Icon(Iconsax.ship),
                      const SizedBox(width: UtSizes.spaceBtwItems / 2),

                      //STATUS AND DATE
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '#7482',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // ICON
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: UtSizes.spaceBtwItems / 2),

                      //STATUS AND DATE
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '18 Jan 2024',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
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
      ),
    );
  }
}
