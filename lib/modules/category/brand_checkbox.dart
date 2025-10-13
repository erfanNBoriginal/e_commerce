import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class BrandCheckBox extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function() onTap;

  const BrandCheckBox({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 32,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              U.Text(title, color: isActive ? U.Theme.primary : U.Theme.black),
              Spacer(),
              U.CheckBox(
                color: U.CheckBoxColor.red,
                onTap: () {},
                isActive: isActive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
