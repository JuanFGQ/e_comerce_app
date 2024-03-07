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
    required this.messaginModel,
    // required this.messaging,
  });
  final MessageModel messaginModel;
  // final MessagingModel messaging;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessaggingController());
    final auth = AuthenticationRepository.instance.authUser.uid;
    return GestureDetector(
      // onTap: () => Get.to(() => ChatScreen(otherUserID: ,)),
      child: Padding(
        padding: const EdgeInsets.only(top: JSizes.md),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: messaginModel.receiverID != auth
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                //!USER IMAGE
                JRoundedImage(
                  borderRadius: 60,
                  height: 60,
                  applyImageRadius: true,
                  width: 60,
                  imageUrl: messaginModel.profilePicture.contains('http')
                      ? messaginModel.profilePicture
                      : JImages.userImage,
                  isNetworkImage: messaginModel.profilePicture.contains('http')
                      ? true
                      : false,
                ),
                const SizedBox(width: JSizes.md),

                //!USER NAME
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //USER NAME
                      Text(messaginModel.userName,
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: JSizes.sm / 2),
                      //USER MESSAGE
                      StreamBuilder(
                          stream: controller.getMessages(
                              otherUserID: messaginModel.receiverID),
                          builder: (context, snapshot) {
                            return Text('messaging.message',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.bodySmall);
                          }),
                    ],
                  ),
                ),
                const SizedBox(width: JSizes.defaultSpace / 2),

                //!NOTIFICATION INFO
                Column(
                  children: [
                    //TIME STAMP MESSAGE
                    const Text('15 min'
                        // 'messaging.timestamp.toString()'
                        ),

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
                        '5',
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
