import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Banner extends StatelessWidget {
  final List<Widget> items;

  const Banner({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: items, options: CarouselOptions());
  }
}
