import 'package:e_comerce_app/common/widgets/image_text_widgets/scrollable_categories.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/screens/shop/screens/sub_category/sub_category.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollableCategories extends StatelessWidget {
  const ScrollableCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //HEADER
          const TSectionHeading(
              textColor: Colors.white,
              title: 'Popular Categories',
              showActionButton: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          //SCROLL CATEGORIES
          SizedBox(
            width: double.infinity,
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TScrollableCategories(
                  image: TImages.facebook,
                  title: 'HOLA',
                  onTap: () => Get.to(() => const SubCategoryScreen()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
