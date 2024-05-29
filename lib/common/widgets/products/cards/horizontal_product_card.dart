import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UtSizes.productImageRadius),
        color: isDark ? UtColors.darkerGrey : UtColors.lightContainer,
      ),
      child: Row(
        children: [
          // THUMBNAIL
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(UtSizes.sm),
            backgroundColor: isDark ? UtColors.dark : UtColors.light,
            child: Stack(
              children: [
                // THUMBNAIL IMAGE
                SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(imageUrl: product.thumbnail, isNetworkImage: true, applyImageRadius: true),
                ),

                // SALE TAG
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: UtSizes.sm,
                      backgroundColor: UtColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: UtSizes.sm, vertical: UtSizes.xs),
                      child: Text(
                        "$salePercentage%",
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: UtColors.black),
                      ),
                    ),
                  ),

                // FAVORITE ICON BUTTON
                Positioned(top: 0, right: 0, child: FavouriteIcon(productId: product.id)),
              ],
            ),
          ),

          // DETAILS
          SizedBox(
            width: 142,
            child: Padding(
              padding: const EdgeInsets.only(top: UtSizes.sm, left: UtSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITLE
                      ProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: UtSizes.spaceBtwItems / 2),
                      BrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // PRICING
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: UtSizes.sm),
                                child: Text(
                                  "\$${product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: UtSizes.sm),
                              child: ProductPriceText(
                                price: controller.getProductPrice(product),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ADD TO CART
                      Container(
                        decoration: const BoxDecoration(
                          color: UtColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(UtSizes.cardRadiusMd),
                            bottomRight: Radius.circular(UtSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: UtSizes.iconLg * 1.2,
                          height: UtSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: UtColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
