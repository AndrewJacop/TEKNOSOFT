import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/search_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        actions: [CartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrollable) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? UtColors.black : UtColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(UtSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      /// -- Search Bar
                      const SizedBox(height: UtSizes.spaceBtwItems),
                      const SearchContainer(
                        text: 'Search in Store',
                        showBoarder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: UtSizes.spaceBtwSections),

                      /// -- Feature Brands
                      SectionHeading(
                          title: 'Featured Brands', onPressed: () {}),
                      const SizedBox(height: UtSizes.spaceBtwSections),

                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: RoundeddContainer(
                              padding: EdgeInsets.all(UtSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [
                                  // -- Icon
                                  Flexible(
                                    child: CircularImage(
                                      image: UtImages.clothIcon,
                                      isNetworkImage: false,
                                      backgroundColor: Colors.transparent,
                                      overlayColor: (isDark
                                          ? UtColors.white
                                          : UtColors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: UtSizes.spaceBtwItems / 2),

                                  // -- Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BrandTitleTextWithVerifiedIcon(
                                            title: 'Nike',
                                            brandTextSize: TextSizes.large),
                                        Text(
                                          "256 products",
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
