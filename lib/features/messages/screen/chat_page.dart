import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/features/messages/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar:
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Messages',
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
          //!MESSAGE BUILDER
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 1,
              itemBuilder: (context, index) => const MessageCard(),
            ),
          ),

          //!USER FORM FIELD
          SizedBox(
            height: 80,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Iconsax.gallery)),
                Expanded(
                  child: Container(
                    height:
                        60, // Puedes ajustar la altura según tus necesidades
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      // controller: controller.discountPrice,
                      // validator: (value) => TValidator.validateEmptyText(
                      //     'discount price', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: 'Say something...',
                        // prefixIcon: Icon(Iconsax.discount_circle),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Iconsax.send1))
              ],
            ),
          ),
        ]));
  }
}
