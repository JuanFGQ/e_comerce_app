import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/loaders/animation_loader_widget.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/vertical_shimmer.dart';
import 'package:e_comerce_app/features/shop/controllers/product/favourite_controller.dart';
import 'package:e_comerce_app/features/shop/screens/screens/home/home.dart';
import 'package:e_comerce_app/navigation_menu.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('WishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomePage()),
          )
        ],
      ),

      //*BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          //*PRODUCTS GRID
          child: Obx(
            () => FutureBuilder(
                future: controller.favoritesProducts(),
                builder: (context, snapshot) {
                  //Nothing Found
                  final emptyWidget = TAnimationControllerWidget(
                    showAction: true,
                    actionText: 'Lets\'s add some',
                    text: 'Whoops! WishList is Empty...',
                    animation: TImages.handLoading,
                    onActionProssed: () =>
                        Get.off(() => const NavigationMenu()),
                  );

                  const loader = TVerticalProductShimmer(itemCount: 6);
                  final widget = TCloudHelperFunction.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  //products founded
                  final products = snapshot.data!;
                  return GridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        ProductCardVertical(product: products[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
