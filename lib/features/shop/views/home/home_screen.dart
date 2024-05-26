import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_t_store/features/shop/views/all_products/all_products_screen.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/home_appbar.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/home_categories_carousel.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/promo_slider.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/search_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const PrimaryHeaderContainer(
                child: Column(
              children: [
                /// App Bar
                HomeAppBar(),
                SizedBox(height: UtSizes.defaultSpace),

                /// Search bar
                SearchContainer(text: "Search in store"),
                SizedBox(height: UtSizes.spaceBtwSections),

                Padding(
                  padding: EdgeInsets.only(left: UtSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// Heading
                      SectionHeading(
                        title: 'Polpular Categories',
                        showActionButton: false,
                        textColor: UtColors.white,
                      ),
                      SizedBox(height: UtSizes.spaceBtwItems),

                      /// Categoires
                      HomeCategoriesCarousel(),
                    ],
                  ),
                ),
                SizedBox(height: UtSizes.spaceBtwSections),
              ],
            )),

            /// Body
            Padding(
                padding: const EdgeInsets.all(UtSizes.defaultSpace),
                child: Column(
                  children: [
                    // Promo SLider
                    const PromoSlider(),
                    const SizedBox(height: UtSizes.spaceBtwSections),

                    // Heading
                    SectionHeading(title: "Popular Products", onPressed: () => Get.to(() => const AllProductsScreen())),
                    const SizedBox(height: UtSizes.spaceBtwItems),

                    // Popular Products
                    Obx(() {
                      if (controller.isLoading.value) return const VerticalProductShimmer();
                      if (controller.featuredProducts.isEmpty) {
                        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                      }
                      return GridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) => VerticalProductCard(product: controller.featuredProducts[index]),
                      );
                    })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
