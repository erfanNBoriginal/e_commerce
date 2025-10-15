import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class Stars extends StatelessWidget {
  final int stars;
  final int? rateCount;
  Stars({super.key, required this.stars, this.rateCount});

  List<Widget> get getStars {
    List<Widget> tempList = [];
    for (int i = 0; i < 5; i++) {
      tempList.add(
        U.Image.Icon(
          size: 14,
          image: i < stars ? U.Icons.activeStar : U.Icons.inactiveStar,
        ),
      );
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...getStars,
        SizedBox(width: 2),
        if (rateCount != null)
          U.Text(
            '(${rateCount.toString()})',
            weight: U.TextWeight.regular,
            fontSize: U.TextSize.s10,
          ),
      ],
    );
  }
}
