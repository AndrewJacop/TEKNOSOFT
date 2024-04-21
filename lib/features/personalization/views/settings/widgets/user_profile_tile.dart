import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
          image: UtImages.user, width: 50, height: 50, padding: 0),
      title: Text("Andrew Jacop",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: UtColors.white)),
      subtitle: Text("andrewjacop@gmail.com",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: UtColors.white)),
      trailing: IconButton(
        icon: const Icon(Iconsax.edit, color: UtColors.white),
        onPressed: onPressed,
      ),
    );
  }
}
