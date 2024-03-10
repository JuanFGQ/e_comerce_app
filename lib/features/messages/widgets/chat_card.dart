import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/messages/controller/messaging_controller.dart';
import 'package:e_comerce_app/features/messages/model/message_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    // required this.messaginModel,
    required this.profilePicture,
    required this.userName,
    required this.lastMessage,
    required this.timeStamp,
    // required this.messaginModel,
    // required this.messaging,
  });
  // final MessageModel messaginModel;
  final String profilePicture;
  final String userName;
  final String lastMessage;
  final String timeStamp;
  // final MessagingModel messaging;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessaggingController());
    final auth = AuthenticationRepository.instance.authUser.uid;
    final newMessageInt = MessaggingController.instance;
    return GestureDetector(
      // onTap: () => Get.to(() => ChatScreen(otherUserID: ,)),
      child: Padding(
        padding: const EdgeInsets.only(top: JSizes.md),
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: messaginModel.receiverID != auth
              //     ? CrossAxisAlignment.start
              //     : CrossAxisAlignment.end,
              children: [
                //!USER IMAGE
                JRoundedImage(
                  borderRadius: 60,
                  height: 60,
                  applyImageRadius: true,
                  width: 60,
                  imageUrl: profilePicture.contains('http')
                      ? profilePicture
                      : JImages.userImage,
                  isNetworkImage:
                      profilePicture.contains('http') ? true : false,
                ),
                const SizedBox(width: JSizes.md),

                //!USER NAME
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //USER NAME
                      Text(userName,
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: JSizes.sm / 2),
                      //USER MESSAGE
                      Text(lastMessage,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                ),
                const SizedBox(width: JSizes.defaultSpace / 2),

                //!NOTIFICATION INFO
                Column(
                  children: [
                    //TIME STAMP MESSAGE
                    Text(timeStamp),

                    const SizedBox(height: JSizes.defaultSpace / 2),

                    //NOTIFICATION CIRCLE
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: JColors.accent,
                      ),
                      child: Center(
                          child: Text(
                        newMessageInt.nonReaded.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: JColors.white, fontSizeFactor: 0.8),
                      )),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: JSizes.defaultSpace / 2),
            const Divider(endIndent: 0, indent: 75)
          ],
        ),
      ),
    );
  }
}
