import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:go_router/go_router.dart';

class AppBar extends StatelessWidget {
  final String title;
  final Widget? action;
  const AppBar({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.2,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(11),
            child: SizedBox.square(
              dimension: 24,
              child: action ?? SizedBox(width: 24),
            ),
          ),
          Spacer(),
          U.Text(title),
          Spacer(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: SizedBox(
                child: U.Image.Icon(size: 24, image: U.Icons.chevron),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
