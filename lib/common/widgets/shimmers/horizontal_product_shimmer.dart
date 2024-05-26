import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: UtSizes.spaceBtwSections),
      height: 120.0,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: UtSizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerEffect(width: 120.0, height: 120.0),
            SizedBox(height: UtSizes.spaceBtwItems),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                SizedBox(height: UtSizes.spaceBtwItems / 2),

                //Text
                ShimmerEffect(width: 160.0, height: 15.0),
                SizedBox(height: UtSizes.spaceBtwItems / 2),
                ShimmerEffect(width: 110.0, height: 15.0),
                SizedBox(height: UtSizes.spaceBtwItems / 2),
                ShimmerEffect(width: 80.0, height: 15.0),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
