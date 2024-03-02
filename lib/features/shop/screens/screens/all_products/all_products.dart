import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/vertical_shimmer.dart';
import 'package:e_comerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar:
          const TAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
          future: futureMethod ?? controller.fetchProductsByQuery(query),
          builder: (context, snapshot) {
            //Check the state of the FutureBuilder snapshot
            const loader = TVerticalProductShimmer();

            //! this function it serves to execute all the has data an hasn´t data from a builder
            final widget = TCloudHelperFunction.checkMultiRecordState(
                snapshot: snapshot, loader: loader);

            //return appropiate widget based on snapshot state
            if (widget != null) return widget;

            //Products Found!
            final products = snapshot.data!;
            return TSortableProducts(products: products);
          },
        ),
      )),
    );
  }
}
