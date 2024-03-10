import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/loaders/animation_loader_widget.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/messages/controller/messaging_controller.dart';
import 'package:e_comerce_app/features/messages/widgets/chat_card.dart';
import 'package:e_comerce_app/features/personalization/controller/user_controller.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessaggingController());

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
          // Padding(
          //   padding: const EdgeInsets.only(left: JSizes.md * 2),
          //   child: Text('Older',
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodyLarge!
          //           .copyWith(fontSize: 20)
          //           .apply(color: JColors.darkGrey)),
          // ),
          // const SizedBox(height: JSizes.sm / 2),

          //*HERE I NEED TO FETCH FOR CHATROOM ID´s AVAILABLES FOR THIS USER AND THEN GET IT
          StreamBuilder(
            stream: controller.fetchLastMeesage(),
            builder: (context, snapshot) {
              //nothing found
              if (snapshot.hasError) {
                return const Expanded(
                  child: JAnimationControllerWidget(
                    text: 'No messagges yet',
                    animation: JImages.noMessag,
                  ),
                );
              }

              //waiting for data

              if (snapshot.connectionState == ConnectionState.waiting) {
                Future.delayed(const Duration(seconds: 1));
                return Center(child: const CircularProgressIndicator());
              }

//data found
              return Expanded(
                  child: ListView(
                // controller: _scrollController,
                // reverse: false,
                children: snapshot.data!.docs
                    .map((e) => _buildMessageItem(e))
                    .toList(),
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return ChatCard(
      profilePicture: data['photoUrl'],
      userName: data['userName'],
      lastMessage: data['message'],
      timeStamp: data['timeStamp'],
    );
  }
}
