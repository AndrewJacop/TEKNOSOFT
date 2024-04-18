import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    required this.price,
    this.isLarge = F,
    this.currencySign = '\$',
    this.maxLines = 1,
    this.lineThrought = false,
  });

  final String price, currencySign;
  final bool isLarge;
  final int maxLines;
  final bool lineThrought;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrought ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrought ? TextDecoration.lineThrough : null),
    );
  }
}
