import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_price_text.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final price = controller.getProductPrice(product);
    final stock = controller.getProductStockStatus(product.stock);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price $ Sale Price
        Row(
          children: [
            // sale tage
            RoundedContainer(
              radius: UtSizes.sm,
              backgroundColor: UtColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: UtSizes.sm, vertical: UtSizes.xs),
              child:
                  Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: UtColors.black)),
            ),
            const SizedBox(width: UtSizes.spaceBtwItems),

            /// Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text("\$${product.price}",
                  style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: UtSizes.spaceBtwItems),

            /// Sale Price
            ProductPriceText(price: "\$$price", isLarge: true)
          ],
        ),
        const SizedBox(height: UtSizes.spaceBtwItems / 1.5),

        /// Title
        ProductTitleText(title: product.title),
        const SizedBox(height: UtSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: "Status"),
            const SizedBox(width: UtSizes.spaceBtwItems / 1.5),
            Text(stock, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: UtSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: isDark ? UtColors.white : UtColors.black,
            ),
            BrandTitleTextWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
