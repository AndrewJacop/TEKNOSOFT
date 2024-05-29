import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/products/add_to_cart/add_to_cart_button.dart';
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
          // Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(UtSizes.sm),
            backgroundColor: isDark ? UtColors.dark : UtColors.light,
            child: Stack(
              children: [
                // Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(imageUrl: product.thumbnail, isNetworkImage: true, applyImageRadius: true),
                ),

                // Sale Tag
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

                // Favourite Icon Button
                Positioned(top: 0, right: 0, child: FavouriteIcon(productId: product.id)),
              ],
            ),
          ),

          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: UtSizes.sm, left: UtSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      ProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: UtSizes.spaceBtwItems / 2),
                      BrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
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
                              child: ProductPriceText(price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

                      // Add to Cart
                      ProductCardAddToCartButton(product: product),
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
