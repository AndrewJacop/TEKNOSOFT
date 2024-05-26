import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_t_store/features/personalization/views/profile/widgets/change_name_screen.dart';
import 'package:flutter_t_store/features/personalization/views/profile/widgets/profile_menu_tile.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      if (contoller.imageUploading.value) {
                        return const ShimmerEffect(width: 80, height: 80);
                      } else {
                        final networkImage = contoller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : UtImages.user;
                        return CircularImage(
                          isNetworkImage: networkImage.isNotEmpty,
                          image: image,
                          width: 80,
                          height: 80,
                        );
                      }
                    }),
                    TextButton(
                        onPressed: () => contoller.uploadUserProfilePicture(),
                        child: const Text("Change Profile Pucture")),
                  ],
                ),
              ),

              const SizedBox(height: UtSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: UtSizes.spaceBtwItems),

              /// Details
              /// Heading Profile Info
              const SectionHeading(title: "Profile Information", showActionButton: false),
              const SizedBox(height: UtSizes.spaceBtwItems),

              ProfileMenuTile(
                  title: "Name",
                  value: contoller.user.value.fullName,
                  onPressed: () => Get.to(const ChangeNameScreen())),
              ProfileMenuTile(title: "Username", value: contoller.user.value.username, onPressed: () {}),

              const SizedBox(height: UtSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: UtSizes.spaceBtwItems),

              /// Heading Personal Info
              const SectionHeading(title: "Personal Information", showActionButton: false),
              const SizedBox(height: UtSizes.spaceBtwItems),

              ProfileMenuTile(title: "User ID", value: contoller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
              ProfileMenuTile(title: "E-mail", value: contoller.user.value.email, onPressed: () {}),
              ProfileMenuTile(title: "Phone Number", value: contoller.user.value.phoneNumber, onPressed: () {}),
              ProfileMenuTile(title: "Gender", value: "Male", onPressed: () {}),
              ProfileMenuTile(title: "Date of Birth", value: "06 Oct, 1993", onPressed: () {}),
              const Divider(),
              const SizedBox(height: UtSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  child: const Text("Close Account"),
                  onPressed: () => contoller.deleteAccountWarningPopup(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
