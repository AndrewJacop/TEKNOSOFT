import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/images/circular_image.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/personalization/views/profile/widgets/profile_menu_tile.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(
                        image: UtImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Pucture")),
                  ],
                ),
              ),

              const SizedBox(height: UtSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: UtSizes.spaceBtwItems),

              /// Details
              /// Heading Profile Info
              const SectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: UtSizes.spaceBtwItems),

              ProfileMenuTile(
                  title: "Name", value: "Andrew Jacop", onPressed: () {}),
              ProfileMenuTile(
                  title: "Username", value: "Andrew_Jacop", onPressed: () {}),

              const SizedBox(height: UtSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: UtSizes.spaceBtwItems),

              /// Heading Personal Info
              const SectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: UtSizes.spaceBtwItems),

              ProfileMenuTile(
                  title: "User ID",
                  value: "456789",
                  icon: Iconsax.copy,
                  onPressed: () {}),
              ProfileMenuTile(
                  title: "E-mail",
                  value: "andrewjacop@gmail.com",
                  onPressed: () {}),
              ProfileMenuTile(
                  title: "Phone Number",
                  value: "01234567890",
                  onPressed: () {}),
              ProfileMenuTile(title: "Gender", value: "Male", onPressed: () {}),
              ProfileMenuTile(
                  title: "Date of Birth",
                  value: "06 Oct, 1993",
                  onPressed: () {}),
              const Divider(),
              const SizedBox(height: UtSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  child: const Text("Close Account"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
