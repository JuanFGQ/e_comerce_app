import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/features/shop/models/cart_item_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //IMAGE

        TRoundedImage(
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backGroundColor: THelperFunction.isDarkMode(context)
              ? TColors.light
              : TColors.dark,
        ),
        const SizedBox(width: TSizes.spaceBtwSection),

        //title,price & size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TBrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: ProductTitleText(title: cartItem.title, maxLines: 1)),

              ///attributes
              Text.rich(
                TextSpan(
                    children: (cartItem.selectedVariation ?? {})
                        .entries
                        .map((e) => TextSpan(children: [
                              TextSpan(
                                  text: e.key,
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: e.value,
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ]))
                        .toList()

                    ///dummy data
                    // [
                    //   TextSpan(
                    //       text: 'Color ',
                    //       style: Theme.of(context).textTheme.bodySmall),
                    //   TextSpan(
                    //       text: 'Green ',
                    //       style: Theme.of(context).textTheme.bodyLarge),
                    //   TextSpan(
                    //       text: 'Size ',
                    //       style: Theme.of(context).textTheme.bodySmall),
                    //   TextSpan(
                    //       text: 'EU 44 ',
                    //       style: Theme.of(context).textTheme.bodyLarge),
                    // ],
                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}
