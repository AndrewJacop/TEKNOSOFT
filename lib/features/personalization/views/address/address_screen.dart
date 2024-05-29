import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter_t_store/features/personalization/controllers/address_controller.dart';
import 'package:flutter_t_store/features/personalization/views/address/add_new_address_screen.dart';
import 'package:flutter_t_store/features/personalization/views/address/widget/single_address.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/device/device_utility.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: UtColors.primary,
        child: const Icon(Iconsax.add, color: UtColors.white),
      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Addresses", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(UtSizes.defaultSpace),
            child: Obx(
              () => FutureBuilder(
                //Use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  // Handle Loader, No Records, or Error Message
                  final emptyWidget = AnimationLoaderWidget(
                    text: "Whoops! Address is Empty...",
                    animation: UtImages.pencilAnimation,
                    showAction: true,
                    actionText: "Let's add some",
                    onActionPressed: () => Get.to(() => const AddNewAddressScreen()),
                  );
                  final loader = Column(
                    children: [
                      ShimmerEffect(width: UtDeviceUtils.getScreenWidth(context) - 30.0, height: 120.0),
                      const SizedBox(height: UtSizes.spaceBtwItems),
                      ShimmerEffect(width: UtDeviceUtils.getScreenWidth(context) - 30.0, height: 120.0),
                    ],
                  );
                  final widget = UtCloudHelperFunctions.checkMultiRecordState(
                      loader: loader, snapshot: snapshot, nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  // Records Found
                  final addresses = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        return SingleAddressTile(
                          address: addresses[index],
                          onTap: () => controller.selectAddress(addresses[index]),
                        );
                      });
                },
              ),
            )),
      ),
    );
  }
}
