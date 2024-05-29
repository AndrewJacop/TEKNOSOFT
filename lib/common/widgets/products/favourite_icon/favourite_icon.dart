import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/icons/circular_icon.dart';
import 'package:flutter_t_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final favouritesController = Get.put(FavouritesController());
    return Obx(
      () => CircularIcon(
        onPressed: () => favouritesController.toggleFavouriteProduct(productId),
        icon: favouritesController.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: favouritesController.isFavourite(productId) ? UtColors.error : null,
      ),
    );
  }
}
