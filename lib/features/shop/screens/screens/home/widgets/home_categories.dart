import 'package:e_comerce_app/common/widgets/image_text_widgets/scrollable_categories.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/category_shimmer.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_comerce_app/features/shop/models/category_model.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/sub_category/sub_category.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
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
          Obx(() {
            if (controller.isLoading.value) return const TCategoryShimmer();
            if (controller.featuredCategories.isEmpty) {
              return Center(
                child: Text('No Data Found!',
                    style: Theme.of(context).textTheme.bodyMedium),
              );
            }

            return SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = controller.featuredCategories[index];
                  return TScrollableCategories(
                    isNetworkImage: true,
                    image: category.image,
                    title: category.name,
                    onTap: () => Get.to(() =>
                        SubCategoryScreen(category: CategoryModel.empty())),
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
