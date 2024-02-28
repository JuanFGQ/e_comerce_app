import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_comerce_app/features/messages/controller/messaging_controller.dart';
import 'package:e_comerce_app/features/messages/screen/chat_page.dart';
import 'package:e_comerce_app/features/messages/widgets/chat_card.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessaggingController());
    final dark = THelperFunction.isDarkMode;

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Messages',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: TSizes.spaceBtwSection),
          //todo: if(newMessages)
          // Flexible(
          //   child: Visibility(
          //     visible: false,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: TSizes.md * 2),
          //           child: Text('Recent',
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .headlineLarge!
          //                   .apply(color: Colors.white)),
          //         ),
          //         const SizedBox(height: TSizes.spaceBtwItems),
          //         Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.all(TSizes.defaultSpace),
          //             child: ListView.builder(
          //               itemCount: 1,
          //               itemBuilder: (context, index) => ChatCard(),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(height: TSizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.only(left: TSizes.md * 2),
            child: Text('Older',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20)
                    .apply(color: TColors.darkGrey)),
          ),
          const SizedBox(height: TSizes.sm / 2),
          StreamBuilder(
            stream: controller.getUserList(),
            builder: (context, snapshot) {
              //error
              if (snapshot.hasError) {
                return const Text("Error");
              }

              //loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading.");
              }

              //data founded

              return Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ChatCard(
                          userModel: snapshot.data![index],
                          messaging: ),
                    )
                    // ListView(
                    //   children: snapshot.data!
                    //       .map<Widget>((userData) => ChatCard(
                    //           userModel: controller.getUserList[index],
                    //           messaging: messaging))
                    //       .toList(),
                    // ),
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
