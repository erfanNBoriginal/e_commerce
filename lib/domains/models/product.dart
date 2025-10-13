import 'dart:ui';

import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/rating.dart';
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String image;
  final String title;
  final int? off;
  final List<Rating> ratings;
  final String description;
  final String brand;
  final bool newProduct;
  final int price;
  final String category;
  final List<Color> colors;
  final CategoryData categoryData;
  final List<String> sizes;
  Product({
    required this.category,
    this.colors = const [Colors.amber, Colors.red, Colors.blue],
    this.sizes = const ['XS', 'S', 'M', 'L', 'XL'],
    this.newProduct = false,
    this.off,
    required this.id,
    required this.brand,
    required this.image,
    required this.title,
    required this.ratings,
    required this.description,
    required this.price,
    required this.categoryData,
  });
  double get getRating {
    int finall = 0;
    for (var i = 0; i < ratings.length; i++) {
      finall = finall + ratings[i].stars;
    }
    double last = finall / ratings.length;
    return last;
  }
}
