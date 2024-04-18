import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/text/brand_title_text.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class BrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const BrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = UtColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            brandTextSize: brandTextSize,
            textAlign: textAlign,
            maxLines: maxLines,
          ),
        ),
        const SizedBox(width: UtSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: UtSizes.iconXs,
        )
      ],
    );
  }
}
