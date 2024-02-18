import 'package:e_comerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/boxes_shimmer.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/category_list_shimmer.dart';
import 'package:e_comerce_app/features/shop/controllers/product/brand_controller.dart';
import 'package:e_comerce_app/features/shop/models/category_model.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          //handle loade , No record , Or Error Message
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TBoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              )
            ],
          );

          final widget = TCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          //Record Found
          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    //handle loader , No record, Or Error Message
                    final widget = TCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    //record Found!

                    final products = snapshot.data!;

                    return TBrandShowCase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            },
          );
        });
  }
}
