import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/home_appbar.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/home_categories_carousel.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/search_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
                child: Column(
              children: [
                /// App Bar
                HomeAppBar(),
                SizedBox(height: UtSizes.defaultSpace),

                /// Search bar
                SearchContainer(text: "Search in store"),
                SizedBox(height: UtSizes.spaceBtwSections),

                /// Categoires
                SectionHeading(
                  title: 'Polpular Categories',
                  showActionButton: false,
                  textColor: UtColors.white,
                ),
                SizedBox(height: UtSizes.spaceBtwItems),
                HomeCategoriesCarousel()
              ],
            )),
          ],
        ),
      ),
    );
  }
}
