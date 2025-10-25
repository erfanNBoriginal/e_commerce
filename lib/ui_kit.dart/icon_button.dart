import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum IconButtonSize { small, large }

class IconButton extends StatelessWidget {
  final IconButtonSize size;
  final Color? color;
  final String icon;
  final void Function() onTap;
  const IconButton({
    super.key,
    this.color,
    required this.size,
    required this.icon,
    required this.onTap,
  });

  ({double size, double padding}) get getSize {
    switch (size) {
      case IconButtonSize.small:
        return (padding: 6.0, size: 36.0);
      case IconButtonSize.large:
        return (padding: 13.0, size: 52.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSize.size,
      height: getSize.size,
      child: Material(
        color: color,
        shape: CircleBorder(),
        elevation: 0.9,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(getSize.padding),
            child: U.Image.Icon(boxfit: BoxFit.contain, image: icon),
          ),
        ),
      ),
    );
  }
}
