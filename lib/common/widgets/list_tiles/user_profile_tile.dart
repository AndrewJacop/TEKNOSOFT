import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : UtImages.user;
        if (controller.imageUploading.value) {
          return const ShimmerEffect(height: 50.0, width: 50.0, radius: 50.0);
        } else {
          return CircularImage(
            image: image,
            fit: BoxFit.cover,
            width: 50.0,
            height: 50.0,
            isNetworkImage: networkImage.isNotEmpty,
          );
        }
      }),
      title: Obx(
        () {
          if (controller.profileLoading.value) {
            return const ShimmerEffect(width: 100.0);
          } else {
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: UtColors.white),
            );
          }
        },
      ),
      subtitle: Obx(
        () {
          if (controller.profileLoading.value) {
            return const ShimmerEffect(width: 100.0);
          } else {
            return Text(
              controller.user.value.email,
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: UtColors.white),
            );
          }
        },
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: UtColors.white,
        ),
      ),
    );
  }
}
