import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class TextButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const TextButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(2.5), child: U.Text(text)),
      ),
    );
  }
}
