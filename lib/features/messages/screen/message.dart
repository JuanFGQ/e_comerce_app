import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_comerce_app/features/messages/widgets/chat_card.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode;
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Messages',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.spaceBtwSection),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.md * 2),
                  child: Text('Recent',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .apply(color: Colors.white)),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) => ChatCard(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.md * 2),
              child: Text('Older',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(color: Colors.white)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => const ChatCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
