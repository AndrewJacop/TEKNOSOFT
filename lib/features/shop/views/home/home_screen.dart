import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/home_appbar.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/home_categories_carousel.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/promo_slider.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/search_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Heading
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
                )
              ],
            )),

            /// Body
            Padding(
                padding: const EdgeInsets.all(UtSizes.defaultSpace),
                child: Column(
                  children: [
                    // Promo SLider
                    const PromoSlider(
                      banners: [
                        UtImages.promoBanner1,
                        UtImages.promoBanner2,
                        UtImages.promoBanner3,
                      ],
                    ),
                    const SizedBox(height: UtSizes.spaceBtwSections),

                    // Popular Products
                    GridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const VerticalProductCard(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
