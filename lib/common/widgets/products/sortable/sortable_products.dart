import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = AllProductsController.instance;
    controller.assignProducts(products);

    return Column(
      children: [
        // DROPDOWN
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
          value: controller.selectedSortOption.value,
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),

        const SizedBox(height: UtSizes.spaceBtwSections),

        // Products
        Obx(
          () => GridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => VerticalProductCard(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
