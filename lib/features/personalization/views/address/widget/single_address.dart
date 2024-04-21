import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddressTile extends StatelessWidget {
  const SingleAddressTile({super.key, required this.selectedAdress});

  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final darkMode = UtHelperFunctions.isDarkMode(context);

    return RoundedContainer(
      padding: const EdgeInsets.all(UtSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAdress
          ? UtColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAdress
          ? Colors.transparent
          : darkMode
              ? UtColors.darkerGrey
              : UtColors.grey,
      margin: const EdgeInsets.only(bottom: UtSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAdress ? Iconsax.tick_circle3 : null,
              color: selectedAdress
                  ? darkMode
                      ? UtColors.light
                      : UtColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abcde Ghk',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: UtSizes.sm / 2),
              const Text(
                '(+123) 456 7890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: UtSizes.sm / 2),
              const Text(
                '82644 Timmy Caves, South Liana, Maine, 87665, USA',
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
