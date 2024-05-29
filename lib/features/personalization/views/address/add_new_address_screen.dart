import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/features/personalization/controllers/address_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Add New Address", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  // const Text("Add new product Delivery address with the reciever's name"),
                  // const SizedBox(height: UtSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.name,
                    validator: (value) => UtValidator.validateRequiredField("Name", value),
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Name"),
                  ),
                  const SizedBox(height: UtSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: UtValidator.validatePhoneNumber,
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "Phone Number"),
                  ),
                  const SizedBox(height: UtSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.street,
                          validator: (value) => UtValidator.validateRequiredField("Street", value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: "Street"),
                        ),
                      ),
                      const SizedBox(width: UtSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: controller.postalCode,
                          validator: (value) => UtValidator.validateRequiredField("Postal Code", value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Postal Code"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: UtSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.city,
                          validator: (value) => UtValidator.validateRequiredField("City", value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "City"),
                        ),
                      ),
                      const SizedBox(width: UtSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: controller.state,
                          validator: (value) => UtValidator.validateRequiredField("State", value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "State"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: UtSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.country,
                    validator: (value) => UtValidator.validateRequiredField("Country", value),
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: "Country"),
                  ),
                  const SizedBox(height: UtSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.addNewAdresses(),
                      child: Text("Save", style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white)),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
