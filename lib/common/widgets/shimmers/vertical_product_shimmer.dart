import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image
                  ShimmerEffect(width: 180.0, height: 180.0),
                  SizedBox(height: UtSizes.spaceBtwItems),

                  //Text
                  ShimmerEffect(width: 160.0, height: 15.0),
                  SizedBox(height: UtSizes.spaceBtwItems / 2),
                  ShimmerEffect(width: 110.0, height: 15.0),
                ],
              ),
            ));
  }
}
