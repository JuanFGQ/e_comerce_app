import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_comerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Brand Name'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //BRAND DETAIL
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSection),
              TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
