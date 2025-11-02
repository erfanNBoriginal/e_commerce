import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

enum OutlineButtonSize { small, large }

enum BorderVariants { black, white }

class OutlineButton extends StatelessWidget {
  // final Color color;
  final String title;
  final Widget? trailing;
  final OutlineButtonSize size;
  final double bordeRaius;
  final BorderVariants borderType;
  final void Function() onTap;
  const OutlineButton({
    super.key,
    this.trailing,
    required this.onTap,
    this.bordeRaius = 24,
    required this.borderType,
    required this.size,
    required this.title,
    // required this.color,
  });

  get _size {
    switch (size) {
      case OutlineButtonSize.small:
        return 36.0;
      case OutlineButtonSize.large:
        return 48.0;
    }
  }

  ({Color color, double width}) get border {
    switch (borderType) {
      case BorderVariants.black:
        return (color: U.Theme.black, width: 1);

      case BorderVariants.white:
        return (color: U.Theme.white, width: 1.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(bordeRaius),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: border.color, width: border.width),
            borderRadius: BorderRadius.circular(bordeRaius),
          ),
          height: _size,
          // width: width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  U.Text(title, color: border.color),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
