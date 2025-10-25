import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class ProductStack extends StatelessWidget {
  final BagItem item;

  const ProductStack({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Base colored circle
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.color,
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
          // Size badge overlay
          Positioned(
            top: -2,
            left: 22,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Center(child: U.Text(item.size ?? '')),
            ),
          ),
          // Count badge
          Positioned(
            right: -6,
            bottom: -4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: U.Theme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: U.Text('${item.count}x'),
            ),
          ),
        ],
      ),
    );
  }
}
