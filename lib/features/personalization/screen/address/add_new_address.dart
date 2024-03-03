import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/features/personalization/controller/address_controller.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAssresScreen extends StatelessWidget {
  const AddNewAssresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const JAppBar(
        showBackArrow: true,
        title: Text('Add new address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Form(
              key: controller.addressFormKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: controller.name,
                      validator: (value) =>
                          JValidator.validateEmptyText('Name', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                  const SizedBox(height: JSizes.spaceBtwInputFields),
                  TextFormField(
                      validator: JValidator.validatePhoneNumber,
                      controller: controller.phoneNumber,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.mobile),
                          labelText: 'Phone Number')),
                  const SizedBox(height: JSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) =>
                              JValidator.validateEmptyText('Street', value),
                          controller: controller.street,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              labelText: 'Street'),
                        ),
                      ),
                      const SizedBox(width: JSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          validator: (value) => JValidator.validateEmptyText(
                              'Postal Code', value),
                          controller: controller.postalCode,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              labelText: 'Postal Code'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: JSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) =>
                              JValidator.validateEmptyText('City', value),
                          controller: controller.city,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              labelText: 'City'),
                        ),
                      ),
                      const SizedBox(width: JSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          validator: (value) =>
                              JValidator.validateEmptyText('State', value),
                          controller: controller.state,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity),
                              labelText: 'State'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: JSizes.spaceBtwInputFields),
                  TextFormField(
                      controller: controller.country,
                      validator: (value) =>
                          JValidator.validateEmptyText('Country', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.global),
                          labelText: 'Country')),
                  const SizedBox(height: JSizes.spaceBtwInputFields),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.addNewAddress(),
                        child: const Text('Save')),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
