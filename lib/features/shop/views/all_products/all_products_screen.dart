import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_t_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      /// Appbar
      appBar: CustomAppBar(title: Text(title), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // Check state of the FutureBuilder Snapshot
                final widget = UtCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: const VerticalProductShimmer(),
                );
                if (widget != null) return widget;

                // Products Found
                final products = snapshot.data!;
                return SortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
