import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/personalization/views/address/address_screen.dart';
import 'package:flutter_t_store/features/personalization/views/profile/profile_screen.dart';
import 'package:flutter_t_store/features/personalization/views/settings/widgets/settings_menu_tile.dart';
import 'package:flutter_t_store/features/personalization/views/settings/widgets/user_profile_tile.dart';
import 'package:flutter_t_store/features/shop/views/home/widgets/primary_header_container.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  CustomAppBar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: UtColors.white)),
                  ),
                  const SizedBox(height: UtSizes.spaceBtwSections),

                  /// User Profile Card
                  UserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: UtSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(UtSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const SectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: UtSizes.spaceBtwItems),

                  SettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Addresses",
                      subTitle: "Set shoping delivery address",
                      onTap: () => Get.to(() => const AddressScreen())),
                  SettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add, remove products and move to checkout",
                      onTap: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subTitle: "In-progress and Completed Orders",
                      onTap: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: "Withdraw balance to registerd bank account",
                      onTap: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "List of all the discounted coupons",
                      onTap: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Set any kind of notification message",
                      onTap: () {}),
                  SettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts",
                      onTap: () {}),
                  const SizedBox(height: UtSizes.spaceBtwSections),

                  /// -- App settings
                  const SectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: UtSizes.spaceBtwItems),
                  const SettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload Data to your Cloud Firebase"),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: "Get recommendations based on your location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: "Search Result is Safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: UtSizes.spaceBtwSections),

                  /// -- Log out Button
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text("Logout"))),
                  const SizedBox(height: UtSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
