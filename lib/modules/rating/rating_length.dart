import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class RatingLength extends StatelessWidget {
  final List<int> ratings;

  const RatingLength({required this.ratings, super.key});

  Map<int, int> calculations() {
    Map<int, int> map = {};
    for (var i = 5; i > 0; i--) {
      List<int> temp = [];
      temp = [...ratings.where((e) => e == i)];
      map.addEntries(<int, int>{i: temp.length}.entries);
    }
    return map;
  }

  List<Widget> getStars(int t) {
    List<Widget> temp = [];
    for (var i = 5; i > 0; i--) {
      if (i > t) {
        temp.add(SizedBox(width: 15));
      } else {
        temp.add(U.Image.Icon(size: 15, image: U.Icons.activeStar));
      }
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...calculations().entries.map(
          (e) => Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [...getStars(e.key)],
                      ),
                      SizedBox(width: 5),
                      e.value == 0
                          ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: U.Theme.primary,
                            ),
                            height: 8,
                            width: 8,
                          )
                          : Expanded(
                            flex: e.value + 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: U.Theme.primary,
                              ),
                              height: 8,
                            ),
                          ),
                      Expanded(
                        flex: ratings.length - e.value,

                        child: Container(height: 8),
                      ),
                      U.Text(e.value.toString(), weight: U.TextWeight.regular),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 3),
            ],
          ),
        ),
      ],
    );
  }
}
