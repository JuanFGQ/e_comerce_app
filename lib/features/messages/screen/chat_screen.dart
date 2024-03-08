import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/loaders/animation_loader_widget.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/messages/controller/messaging_controller.dart';
import 'package:e_comerce_app/features/messages/model/message_model.dart';
import 'package:e_comerce_app/features/messages/widgets/chat_card.dart';
import 'package:e_comerce_app/features/messages/widgets/message_card.dart';
import 'package:e_comerce_app/features/personalization/controller/user_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/navigation_menu.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatefulWidget {
  final ProductModel product;
  const ChatScreen({
    super.key,
    required this.product,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FocusNode listViewFocusNode = FocusNode();
  final userController = UserController.instance;

  @override
  void initState() {
    super.initState();

    //add listener to focus node
    listViewFocusNode.addListener(() {
      if (listViewFocusNode.hasFocus) {
        //cause a delay so that the keyboard has time to show up
        //then the amount of remaining space will be calculated.
        Future.delayed(Duration(milliseconds: 500), () => scrollDown());
      }
    });
    //wait a bit for listView to be built, then scroll to bottom
    Future.delayed(Duration(milliseconds: 500), () => scrollDown());
  }

  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    listViewFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessaggingController());

    return Scaffold(
        // bottomNavigationBar:
        appBar: JAppBar(
          showBackArrow: true,
          title: Text(widget.product.brand!.name,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(child: Text('add to friends')),
                const PopupMenuItem(child: Text('report user')),
              ],
            )
          ],
        ),
        body: Column(children: [
          //!MESSAGE STREAM

          StreamBuilder(
            stream: controller.getMessages(
                userID: userController.user.value.id,
                otherUserID: widget.product.brand!.id),
            builder: (context, snapshot) {
              //nothing found
              if (snapshot.hasError) {
                return const Expanded(
                  child: JAnimationControllerWidget(
                    text: 'Chat with your seller',
                    animation: JImages.noMessag,
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              // final widget = JCloudHelperFunction.checkMultiRecordState(
              //     snapshot: snapshot, nothingFound: emptyWidget);
              // if (widget != null) return widget;

              //data found
              return Expanded(
                  child: ListView(
                controller: _scrollController,
                // reverse: false,
                children: snapshot.data!.docs
                    .map((e) => _buildMessageItem(e))
                    .toList(),
              ));
            },
          ),

          //!USER FORM FIELD
          SizedBox(
            height: 80,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Iconsax.gallery)),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: Form(
                      key: controller.messagesForm,
                      child: TextFormField(
                        focusNode: listViewFocusNode,
                        controller: controller.messages,
                        validator: (value) =>
                            JValidator.validateEmptyText('Text', value),
                        keyboardType: TextInputType.text,
                        // controller: controller.discountPrice,

                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'Say something...',
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.sendMessages(
                          receptorID: widget.product.brand!.id);
                    },
                    icon: const Icon(Iconsax.send1))
              ],
            ),
          ),
        ]));
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final _auth = Get.put(AuthenticationRepository());

    bool isCurrentUser = data['senderID'] == _auth.authUser.uid;

    return MessageCard(
      alignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      photoUrl: data['photoUrl'],
      userName: data['userName'],
      message: data['message'],
      // timeStamp: data['timeStamp'],
    );
  }
}
