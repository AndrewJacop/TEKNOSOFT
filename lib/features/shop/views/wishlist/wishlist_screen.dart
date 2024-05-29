import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_t_store/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_t_store/common/widgets/products/cards/vertical_product_card.dart';
import 'package:flutter_t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_t_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:flutter_t_store/navigation_menu.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      /// Custom Appbar
      appBar: CustomAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Iconsax.add, onPressed: () {})],
      ),

      /// Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),

        /// Product Grid
        child: Obx(
          () => FutureBuilder(
              future: controller.favouriteProducts(),
              builder: (_, snapshot) {
                // Handle Loader, No Records, or Error Message
                final emptyWidget = AnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: UtImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );
                const loader = VerticalProductShimmer(itemCount: 6);
                final widget = UtCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if (widget != null) return widget;

                // Records Found
                final products = snapshot.data!;
                return Column(
                  children: [
                    GridLayout(itemCount: 6, itemBuilder: (_, index) => VerticalProductCard(product: products[index]))
                  ],
                );
              }),
        ),
      ),
    );
  }
}
