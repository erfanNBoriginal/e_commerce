import 'package:e_commerce/ui_kit.dart/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class Counter extends StatelessWidget {
  final int count;

  const Counter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        U.IconButton(
          size: IconButtonSize.small,
          icon: U.Icons.add,
          onTap: () {},
        ),
        SizedBox(width: 16),
        Text(count.toString()),
        SizedBox(width: 16),
        U.IconButton(
          size: IconButtonSize.small,
          icon: U.Icons.minus,
          onTap: () {},
        ),
      ],
    );
  }
}
