import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class SelectedFilter extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool isSelected;
  const SelectedFilter({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        color: isSelected ? U.Theme.primary : U.Theme.background,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: U.Text(
            title,
            fontSize: U.TextSize.s16,
            color: isSelected ? U.Theme.white : U.Theme.black,
          ),
        ),
      ),
    );
  }
}
