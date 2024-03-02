import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_comerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/new_product_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JSelectedCategory extends StatelessWidget {
  const JSelectedCategory({
    super.key,
    // required this.products,
  });
  // final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewProductController());
    // controller.assignProducts(products);
    return Column(
      children: [
        //dropdown

        DropdownButtonFormField(
          hint: const Text('Selected the category'),
          // value: controller.selectedSortOption.value,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {
            //select products based on the selected option
            controller.setCategoryId(value!);
          },
          items: [
            'Animals',
            'Clothes',
            'Cosmetics',
            'Tools',
            'Electricity',
            'Electronics',
            'Furniture',
            'Jewelry',
            'Shoes',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSection),

        //PRODUCTS
        // Obx(
        //   () => GridLayout(
        //     itemCount: controller.products.length,
        //     itemBuilder: (_, index) =>
        //         ProductCardVertical(product: controller.products[index]),
        //   ),
        // )
      ],
    );
  }
}
