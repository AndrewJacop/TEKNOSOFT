import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          )),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: UtColors.black),
          child: Center(
            child: Text(
              "2",
              style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: UtColors.white,
                    fontSizeFactor: 0.8,
                  ),
            ),
          ),
        ),
      )
    ]);
  }
}
