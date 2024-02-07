import 'package:e_comerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunction.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor
            ? TCircularContainer(
                width: 50,
                height: 50,
                backGroundColor: THelperFunction.getColor(text)!)
            : null,
        shape: isColor ? CircleBorder() : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        // selectedColor: isColor ? ,
        backgroundColor: isColor ? THelperFunction.getColor(text) : null,
      ),
    );
  }
}
