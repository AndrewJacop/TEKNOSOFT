import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/data/repositories/address/address_repository.dart';
import 'package:flutter_t_store/features/personalization/models/address_model.dart';
import 'package:flutter_t_store/features/personalization/views/address/add_new_address_screen.dart';
import 'package:flutter_t_store/features/personalization/views/address/widget/single_address.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_t_store/utils/helpers/network_manager.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// Variables
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user-specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value =
          addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      UtLoaders.errorSnackBar(title: "Address not found!", message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.dialog(
          barrierDismissible: false,
          Center(
            child: Container(
              color: Colors.transparent,
              child: Container(
                height: 50.0,
                width: 50.0,
                padding: const EdgeInsets.all(12.5),
                decoration: const BoxDecoration(color: UtColors.primary, shape: BoxShape.circle),
                child: const CircularProgressIndicator(
                  color: UtColors.white,
                  strokeWidth: 4,
                ),
              ),
            ),
          ));
      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
      // Assign slected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      UtLoaders.errorSnackBar(title: "Error During Selection!", message: e.toString());
    }
  }

  /// Function to reset form fietds
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    formKey.currentState?.reset();
  }

  /// Add new address
  Future addNewAdresses() async {
    try {
      // Start Loader
      UtFullScreenLoader.openLoadingDialog("Storing Addresses", UtImages.doccerAnimation);

      // Check Internet COnnectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UtFullScreenLoader.stopLoading();
        UtLoaders.warningSnackBar(
            title: 'No Internet Connection',
            message: "You are not connected to the network. Please get connected to proceed.");
        return;
      }

      // Form Validation
      if (!formKey.currentState!.validate()) {
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Save address data
      final address = AddressModel(
          id: "",
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);
      final id = await addressRepository.addAddress(address);

      // Update selected address status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show Success Message
      UtLoaders.successSnackBar(title: 'Congratulations!', message: "Your address has been saved successfully.");

      // Refresh address data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove loader{
      UtFullScreenLoader.stopLoading();
      // Show error message
      UtLoaders.warningSnackBar(title: 'Address Not found!', message: e.toString());
    }
  }

  Future<dynamic> selectNewAddressPopUp(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              padding: const EdgeInsets.all(UtSizes.lg),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeading(
                      title: "Select Address",
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: UtSizes.spaceBtwItems,
                    ),
                    FutureBuilder(
                        future: getAllUserAddresses(),
                        builder: (_, snapshot) {
                          //Helper Functions
                          final response = UtCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                          if (response != null) return response;

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => SingleAddressTile(
                                  address: snapshot.data![index],
                                  onTap: () async {
                                    await selectAddress(snapshot.data![index]);
                                    Get.back();
                                  }));
                        }),
                    const SizedBox(
                      height: UtSizes.defaultSpace * 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const AddNewAddressScreen()),
                        child: const Text("Add new address"),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
