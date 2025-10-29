import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:go_router/go_router.dart';

class AppBar extends StatelessWidget {
  final String title;
  final bool back;
  final bool havElevation;
  final Widget? action;
  const AppBar({super.key,
  this.havElevation = true,
    this.title = '', this.action, this.back = true});

  @override
  Widget build(BuildContext context) {
    return U.Card(
      radius: 0,
      boxShadows: !havElevation ? []: [
        BoxShadow(
          offset: Offset(0, 3),
          color: const Color.fromARGB(35, 0, 0, 0),
          blurRadius: 10,
          spreadRadius: 1
        )
      ],
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // if (action != null)
          Padding(
            padding: EdgeInsets.all(11),
            child: SizedBox.square(
              dimension: 24,
              child: action ?? SizedBox(width: 24),
            ),
          ),
          Spacer(),
          Padding(padding: const EdgeInsets.all(11.0), child: U.Text(
            weight: U.TextWeight.semiBold,
            fontSize: U.TextSize.s18,
            title)),
          Spacer(),

          // if (back)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                !back
                    ? SizedBox(height: 24, width: 24)
                    : InkWell(
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
