import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_comerce_app/features/shop/controllers/product/order_controller.dart';
import 'package:e_comerce_app/navigation_menu.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JOrderListItems extends StatelessWidget {
  const JOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          //Nothing Found Widget
          final emptyWidget = JAnimationLoader(
            text: 'Whoooops!',
            animation: JImages.handLoading,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //Helper function : Handle loader , No Record , Or Error message
          final response = JCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          //Congrats Record Found
          final orders = snapshot.data!;

          return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: JSizes.spaceBtwItems),
              itemCount: orders.length,
              itemBuilder: (_, index) {
                final order = orders[index];

                return JRoundedContainer(
                  padding: const EdgeInsets.all(JSizes.md),
                  showBorder: true,
                  backGroundColor: dark ? JColors.dark : JColors.light,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          ///ICON
                          const Icon(Iconsax.ship),
                          const SizedBox(width: JSizes.spaceBtwItems / 2),

                          //status & date

                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.orderStatisText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(color: JColors.accent)),
                                Text(order.formattedOrdeDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ],
                            ),
                          ),
                          // ICON
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.arrow_right_34,
                                  size: JSizes.iconSm))
                        ],
                      ),
                      const SizedBox(height: JSizes.spaceBtwItems),

                      // ROW 2
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                ///ICON
                                const Icon(Iconsax.tag),
                                const SizedBox(width: JSizes.spaceBtwItems / 2),

                                //status & date

                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Order',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(order.id,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
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
                                const SizedBox(width: JSizes.spaceBtwItems / 2),

                                //status & date

                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Shipping Date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(order.formattedDeliveryDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
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
                );
              });
        });
  }
}
