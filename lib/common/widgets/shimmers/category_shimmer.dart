import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: UtSizes.defaultSpace),
          separatorBuilder: (_, __) => const SizedBox(
                width: UtSizes.spaceBtwItems,
              ),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //IMage
                ShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: UtSizes.spaceBtwItems / 2,
                ),

                //Text
                ShimmerEffect(
                  width: 55,
                  height: 8.0,
                )
              ],
            );
          }),
    );
  }
}
