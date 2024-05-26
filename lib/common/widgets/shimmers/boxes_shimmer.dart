import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ShimmerEffect(
                width: 150.0,
                height: 110.0,
              ),
            ),
            SizedBox(
              width: UtSizes.spaceBtwItems,
            ),
            Expanded(
              child: ShimmerEffect(
                width: 150.0,
                height: 110.0,
              ),
            ),
            SizedBox(
              width: UtSizes.spaceBtwItems,
            ),
            Expanded(
              child: ShimmerEffect(
                width: 150.0,
                height: 110.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
