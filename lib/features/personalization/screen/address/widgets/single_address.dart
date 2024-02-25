import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/features/personalization/controller/address_controller.dart';
import 'package:e_comerce_app/features/personalization/models/address_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Obx(() {
      final selectedAddressID = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressID == address.id;
      return InkWell(
        onTap: onTap,
        child: CRoundedContainer(
          width: double.infinity,
          showBorder: true,
          backGroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? TColors.darkerGrey
                  : TColors.grey,
          margin: const EdgeInsets.all(TSizes.spaceBtwItems),
          widget: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(selectedAddress ? Iconsax.tick_circle : null,
                    color: selectedAddress
                        ? dark
                            ? TColors.light
                            : TColors.dark.withOpacity(0.2)
                        : null),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: TSizes.sm / 2),
                    Text(address.phoneNumber, maxLines: 1),
                    const SizedBox(height: TSizes.sm / 2),
                    Text(
                      '${address.postalCode},${address.country},${address.city}',
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
