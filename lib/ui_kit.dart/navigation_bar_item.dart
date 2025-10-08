import 'package:e_commerce/domains/models/product.dart';
import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class NavigationBarItem {
  final double size;
  final String activePath;
  final String notActivePath;
  final String title;
  const NavigationBarItem({
    required this.size,
    required this.activePath,
    required this.title,
    required this.notActivePath,
  });
}
