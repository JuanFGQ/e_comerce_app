import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.showActionButton = false,
    this.textColor,
    required this.title,
    this.buttonTile = 'View all',
    this.onPressed,
  });

  final bool showActionButton;
  final Color? textColor;
  final String title, buttonTile;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTile))
      ],
    );
  }
}
