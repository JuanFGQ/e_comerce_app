import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/personalization/controller/address_controller.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JBillingAddressSection extends StatelessWidget {
  const JBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JSectionHeading(
              showActionButton: true,
              title: 'Shipping Address',
              buttonTile: 'Change',
              onPressed: () =>
                  addressController.selectNewAddressPopup(context)),
          addressController.selectedAddress.value.id.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Iconsax.user, color: Colors.grey, size: 16),
                        const SizedBox(width: JSizes.spaceBtwItems),
                        Text(addressController.selectedAddress.value.name,
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.grey, size: 16),
                        const SizedBox(width: JSizes.spaceBtwItems),
                        Text(
                            addressController.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        const Icon(Iconsax.location,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: JSizes.spaceBtwItems),
                        Expanded(
                          child: Text(
                              '${addressController.selectedAddress.value.state},${addressController.selectedAddress.value.country},${addressController.selectedAddress.value.city},${addressController.selectedAddress.value.postalCode}',
                              style: Theme.of(context).textTheme.bodyMedium,
                              softWrap: true),
                        ),
                      ],
                    ),
                  ],
                )
              : Text('Select Address',
                  style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
