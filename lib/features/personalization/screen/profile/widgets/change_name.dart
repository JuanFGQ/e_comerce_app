import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/features/personalization/controller/update_name_controller.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: JAppBar(
          showBackArrow: true,
          title: Text('Change Name',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //headings
            Text(
                'Use real name for esay verification. this name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: JSizes.spaceBtwSection),
            Form(
                child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      JValidator.validateEmptyText('First name', value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: JTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: JSizes.spaceBtwInputFields),
                TextFormField(
                  validator: (value) =>
                      JValidator.validateEmptyText('Last name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: JTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: JSizes.spaceBtwSection),

                //save button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.updateUserName,
                      child: const Text('Save')),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
