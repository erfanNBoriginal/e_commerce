import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class NotSelectedButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const NotSelectedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: U.Theme.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.4, color: U.Theme.gray),
        ),
        child: Center(child: U.Text(title)),
      ),
    );
  }
}
