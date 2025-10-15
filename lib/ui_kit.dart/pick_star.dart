import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class PickStar extends StatefulWidget {
  final void Function(int star) onTap;
  const PickStar({super.key, required this.onTap});

  @override
  State<PickStar> createState() => _PickStarState();
}

class _PickStarState extends State<PickStar> {
  int currentStar = 6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 5 * 44,
      height: 66,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onTap(index);
              currentStar = index;
              setState(() {});
            },
            child: SizedBox(
              width: 44,
              height: 44,
              child: U.Image.Icon(
                image:
                    (index <= currentStar && currentStar != 6)
                        ? U.Icons.activeStar
                        : U.Icons.inactiveStar,
              ),
            ),
          );
        },
      ),
    );
  }
}
