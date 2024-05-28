import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_showcase.dart';
import 'package:flutter_t_store/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:flutter_t_store/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:flutter_t_store/features/shop/controllers/brand_controller.dart';
import 'package:flutter_t_store/features/shop/models/category_model.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return FutureBuilder(
        future: brandController.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          // Handle Loader, No Records, or Error Message
          const loader = Column(
            children: [
              ListTileShimmer(),
              SizedBox(height: UtSizes.spaceBtwItems),
              BoxesShimmer(),
              SizedBox(height: UtSizes.spaceBtwItems)
            ],
          );
          final widget = UtCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader, nothingFound: Container());

          if ((widget) != null) return widget;

          // Records Fount
          final brands = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: brandController.getBrandProducts(brandId: brand.id, limit: 3),
                    builder: (_, snapshot) {
                      // Handle Loader, No Records, or Error Message
                      final widget = UtCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      // Records Fount
                      final products = snapshot.data!;
                      return BrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
                    });
              });
        });
  }
}
