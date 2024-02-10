import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //BANNER
              const TRoundedImage(
                  imageUrl: TImages.onBoardingImage1,
                  width: double.infinity,
                  height: null,
                  applyImageRadius: true),
              const SizedBox(height: TSizes.spaceBtwSection),

              //SUB CATEFORY

              Column(
                children: [
                  //heading
                  TSectionHeading(
                      title: 'Sports shirts',
                      onPressed: () {},
                      showActionButton: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  //list of products
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const TProductHorizontalCard();
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
