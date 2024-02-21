import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/product_detail_image_slider.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //MAIN PRODUCT IMAGES

            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Placeholder()),
                )),

            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) =>
                        SizedBox(width: TSizes.spaceBtwItems),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return TRoundedImage(
                        fit: BoxFit.cover,
                        width: 80,
                        imageUrl:
                            'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg',
                        isNetworkImage: true,
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
