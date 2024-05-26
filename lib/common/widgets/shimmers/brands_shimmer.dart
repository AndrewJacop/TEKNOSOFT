import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80.0,
      itemBuilder: (_, __) => const ShimmerEffect(
        width: 300.0,
        height: 80.0,
      ),
    );
  }
}
