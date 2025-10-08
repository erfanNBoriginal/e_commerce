import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

enum ButtonSize { xs, s, m, l }

// enum Radius { r25, r29 }

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final Widget? leading;
  final ButtonSize size;
  final double bordeRaius;
  final void Function() onTap;
  const Button({
    super.key,
    required this.title,
    required this.size,
    required this.onTap,
    required this.bordeRaius,
    required this.color,
    this.leading,
  });

  get _size {
    switch (size) {
      case ButtonSize.xs:
        return 30.0;
      case ButtonSize.s:
        return 36.0;
      case ButtonSize.m:
        return 40.0;
      case ButtonSize.l:
        return 48.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(bordeRaius),
        child: InkWell(
          borderRadius: BorderRadius.circular(bordeRaius),
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leading != null) leading!,
                SizedBox(width: 5),
                U.Text(color: U.Theme.white, title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
