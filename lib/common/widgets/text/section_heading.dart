import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "View all",
    this.textColor,
    this.showActionButton = true,
    this.onPressed,
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: UtSizes.defaultSpace),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showActionButton)
                TextButton(onPressed: onPressed, child: Text(buttonTitle))
            ],
          )
        ],
      ),
    );
  }
}
