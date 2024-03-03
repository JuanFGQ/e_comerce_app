import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/messages/controller/messaging_controller.dart';
import 'package:e_comerce_app/features/messages/model/message_model.dart';
import 'package:e_comerce_app/features/messages/widgets/message_card.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatelessWidget {
  final ProductModel product;
  const ChatScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessaggingController());
    final auth = AuthenticationRepository.instance;

    return Scaffold(
        // bottomNavigationBar:
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Friend  name',
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
            stream: controller.getMessages(otherUserID: product.brand!.id),
            builder: (context, snapshot) {
              //error
              if (snapshot.hasError) {
                return const Text("Error");
              }

              //loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading.");
              }

              return Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) =>
                      MessageCard(userModel: snapshot.data![index]),
                ),
              );
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
                        controller: controller.messages,
                        validator: (value) =>
                            TValidator.validateEmptyText('Name', value),
                        keyboardType: TextInputType.text,
                        // controller: controller.discountPrice,
                        // validator: (value) => TValidator.validateEmptyText(
                        //     'discount price', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'Say something...',
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        controller.sendMessages(productModel: product),
                    icon: const Icon(Iconsax.send1))
              ],
            ),
          ),
        ]));
  }
}
