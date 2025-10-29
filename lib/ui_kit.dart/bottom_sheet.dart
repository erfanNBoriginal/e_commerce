import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class BottomSheet extends StatelessWidget {
  static show(
    BuildContext context, {
    double? maxWidth,
    bool useNavKey = false,
    double? maxHeight,
    required Widget Function(BuildContext context) builder,
  }) {
    return showModalBottomSheet(
      useRootNavigator: useNavKey,
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        // minHeight: 400,
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.80,
        maxWidth: maxWidth ?? 1024,
      ),
      builder: (context) {
        return U.BottomSheet(child: builder(context));
      },
    );
  }

  final Widget child;

  const BottomSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: U.Theme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: U.Theme.gray,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          SizedBox(height: 2),
          Expanded(child: child),
        ],
      ),
    );
  }
}
