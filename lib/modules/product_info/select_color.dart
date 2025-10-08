import 'package:flutter/material.dart';

class SelectColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final void Function() onPressed;
  const SelectColor({
    super.key,
    required this.color,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:
          isSelected
              ? Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.red),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              )
              : Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
    );
  }
}
