import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Iconsax.add, onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: Column(
          children: [
            GridLayout(itemCount: 6, itemBuilder: (_, index) => VerticalProductCard(product: ProductModel.empty()))
          ],
        ),
      ),
    );
  }
}
