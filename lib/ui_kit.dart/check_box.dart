import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

enum CheckBoxColor { red, black }

class CheckBox extends StatelessWidget {
  final CheckBoxColor color;
  final double size;
  final bool isActive;
  final Widget? trailing;
  final void Function() onTap;
  const CheckBox({
    super.key,
    this.trailing,
    this.isActive = false,
    this.size = 22,
    required this.color,
    required this.onTap,
  });

  get getColor {
    switch (color) {
      case CheckBoxColor.black:
        return U.Icons.blackCheckBoxActive;
      case CheckBoxColor.red:
        return U.Icons.redCheckBoxActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: U.Image.Icon(
            size: size,
            image: isActive ? getColor : U.Icons.checkBoxNotActive,
          ),
        ),
        SizedBox(width: 12),
        if (trailing != null) trailing!,
      ],
    );
  }
}
