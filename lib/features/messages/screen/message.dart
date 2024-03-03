import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/loaders/animation_loader_widget.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/vertical_shimmer.dart';
import 'package:e_comerce_app/features/messages/controller/messaging_controller.dart';
import 'package:e_comerce_app/features/messages/widgets/chat_card.dart';
import 'package:e_comerce_app/navigation_menu.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessaggingController());
    final dark = JHelperFunction.isDarkMode;

    return Scaffold(
      appBar: JAppBar(
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
            padding: const EdgeInsets.only(left: JSizes.md * 2),
            child: Text('Older',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20)
                    .apply(color: JColors.darkGrey)),
          ),
          const SizedBox(height: JSizes.sm / 2),
          StreamBuilder(
            stream: controller.getUserMessage(),
            builder: (context, snapshot) {
              //Nothing Found
              const emptyWidget = JAnimationControllerWidget(
                text: '',
                animation: JImages.emptyChat,
              );

              final widget = JCloudHelperFunction.checkMultiRecordState(
                  snapshot: snapshot, nothingFound: emptyWidget);
              if (widget != null) return widget;

              //data founded

              return Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(JSizes.defaultSpace),
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ChatCard(
                        messaginModel: snapshot.data![index],
                      ),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
