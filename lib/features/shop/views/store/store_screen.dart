import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_tabbar.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/controllers/category_controller.dart';
import 'package:flutter_t_store/features/shop/views/brands/all_brands_screen.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/search_container.dart';
import 'package:flutter_t_store/features/shop/views/store/widgets/category_tab.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// -- Appbar
        appBar: CustomAppBar(
          title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [CartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(

            /// -- Header
            headerSliverBuilder: (_, innerBoxIsScrollable) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: isDark ? UtColors.black : UtColors.white,
                  expandedHeight: 440,
                  // Space between Appbar and Tapbar
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
                            title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: UtSizes.spaceBtwItems / 1.5),

                        // -- Brand GRID
                        GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const BrandCard(showBorder: true);
                          },
                        ),
                      ],
                    ),
                  ),
                  // -- Taps
                  bottom: CustomTabBar(
                    tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                  ),
                ),
              ];
            },

            /// -- Body
            body: TabBarView(
              children: categories.map((category) => CategoryTab(category: category)).toList(),
            )),
      ),
    );
  }
}
