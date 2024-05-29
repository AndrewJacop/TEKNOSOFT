import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/images/rounded_image.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text_with_varified_icon.dart';
import 'package:flutter_t_store/common/widgets/text/product_title_text.dart';
import 'package:flutter_t_store/features/shop/models/cart_item_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        RoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(UtSizes.sm),
          backgroundColor: isDark ? UtColors.darkerGrey : UtColors.light,
        ),

        const SizedBox(width: UtSizes.spaceBtwItems),

        // Title, Price, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),

              Flexible(
                child: ProductTitleText(title: cartItem.title, maxLines: 1),
              ),

              // Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map((e) {
                    return TextSpan(children: [
                      TextSpan(text: '${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
