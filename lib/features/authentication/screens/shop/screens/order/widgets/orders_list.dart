import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemCount: 8,
      itemBuilder: (_, index) => CRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        backGroundColor: dark ? TColors.dark : TColors.light,
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ///ICON
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBtwItems / 2),

                //status & date

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: TColors.accent)),
                      Text('07 Nov 2021',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                // ICON
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // ROW 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///ICON
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      //status & date

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('[#3244365]',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ///ICON
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      //status & date

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2025',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
