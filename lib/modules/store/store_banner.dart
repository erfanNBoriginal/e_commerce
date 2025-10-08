import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class StoreBanner extends StatelessWidget {
  const StoreBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: U.Image(
              boxfit: BoxFit.fill,
              image: 'assets/images/skirts1.png',
              // width: 376,
              // height: 196,
            ),
          ),
          Positioned(
            left: 16,
            bottom: 26,
            child: U.Text(
              fontSize: U.TextSize.s34,
              color: U.Theme.white,
              'skirts',
            ),
          ),
        ],
      ),
    );
  }
}
