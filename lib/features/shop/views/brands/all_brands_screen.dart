import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'brand_products_screen.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              // HEADING
              const SectionHeading(title: 'Brands', showActionButton: false),

              const SizedBox(height: UtSizes.spaceBtwItems),

              // BRANDS
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => BrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProductsScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
