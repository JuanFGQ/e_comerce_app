import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_comerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/vertical_shimmer.dart';
import 'package:e_comerce_app/features/shop/controllers/product/brand_controller.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController.instance);
    return Scaffold(
      appBar: JAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //BRAND DETAIL
              JBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(height: JSizes.spaceBtwSection),
              FutureBuilder(
                  future: brandController.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    //handle loader , no record , or Error Message
                    const loader = JVerticalProductShimmer();
                    final widget = JCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    //record found
                    final brandProducts = snapshot.data!;

                    return JSortableProducts(products: brandProducts);
                  })
            ],
          ),
        ),
      ),
    );
  }
}