import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_t_store/features/shop/controllers/brand_controller.dart';
import 'package:flutter_t_store/features/shop/models/brand_model.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: CustomAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              // BRAND DETAIL
              BrandCard(showBorder: true, brand: brand),

              const SizedBox(height: UtSizes.spaceBtwSections),

              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (_, snapshot) {
                    // Handle Loader, No Records, or Error Msg
                    const loader = VerticalProductShimmer();
                    final widget = UtCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record found
                    final productData = snapshot.data!;
                    return SortableProducts(products: productData);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
