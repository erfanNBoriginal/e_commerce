import 'package:e_commerce/domains/models/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class ReviewWidget extends StatelessWidget {
  final Rating rating;
  const ReviewWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: U.Theme.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 10,
                top: 24,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  U.Text('some duude'),
                  SizedBox(height: 9),
                  Row(
                    children: [
                      U.Stars(stars: rating.stars),
                      Spacer(),
                      U.Text(
                        'some Date',
                        color: U.Theme.gray,
                        weight: U.TextWeight.regular,
                        fontSize: U.TextSize.s11,
                      ),
                    ],
                  ),
                  SizedBox(height: 11),
                  U.Text(rating.rating),
                  SizedBox(height: 11),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      U.Text(
                        'helpful',
                        fontSize: U.TextSize.s11,
                        color: U.Theme.gray,
                        weight: U.TextWeight.regular,
                      ),
                      SizedBox(width: 9),
                      U.Image.Icon(image: U.Icons.thumbUp, size: 13),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: U.Theme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
