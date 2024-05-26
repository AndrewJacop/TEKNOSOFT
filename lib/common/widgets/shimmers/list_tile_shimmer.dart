import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ShimmerEffect(
              width: 50.0,
              height: 50.0,
              radius: 50.0,
            ),
            SizedBox(
              width: UtSizes.spaceBtwItems,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerEffect(
                  width: 100.0,
                  height: 15.0,
                ),
                SizedBox(
                  height: UtSizes.spaceBtwItems / 2,
                ),
                ShimmerEffect(
                  width: 80.0,
                  height: 12.0,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
