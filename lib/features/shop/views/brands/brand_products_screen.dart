import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              // BRAND DETAIL
              BrandCard(showBorder: true),

              SizedBox(height: UtSizes.spaceBtwSections),

              SortableProducts(products: []),
            ],
          ),
        ),
      ),
    );
  }
}
