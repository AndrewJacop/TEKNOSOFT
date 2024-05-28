import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/shimmers/brands_shimmer.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/controllers/brand_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import 'brand_products_screen.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
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
              Obx(() {
                if (controller.isLoading.value) return const BrandsShimmer();
                if (controller.allBrands.isEmpty) {
                  return Center(
                    child: Text('No Data Found!',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                  );
                }
                return GridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrands[index];
                    return BrandCard(
                      showBorder: true,
                      brand: brand,
                      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
