import 'dart:ui';

import 'package:e_commerce/domains/models/favorite.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:flutter/material.dart';

class FavoriteRepo {
  List<Favorite> favorites = [];
  Future<List<String>> getSizes() async {
    await Future.delayed(Duration(milliseconds: 100));
    return ['XS', 'S', 'M', 'L', 'XL', 'F'];
  }

  Future<List<Color>> getColors() async {
    await Future.delayed(Duration(milliseconds: 100));
    return [
      Color(0xFF000000),
      Color(0xFFFFFFFF),
      Color(0xFFFF0000),
      Color(0xFF00FF00),
      Color(0xFF0000FF),
      Colors.amber,
      Color(0xFFFF00FF),
      Color(0xFF00FFFF),
    ];
  }

  Future<List<String>> getAllCategories() async {
    await Future.delayed(Duration(milliseconds: 100));
    return ['women', 'men', 'boys', 'girls'];
  }

  Future<List<String>> getBrands() async {
    await Future.delayed(Duration(milliseconds: 100));
    return [
      'Zara',
      'H&M',
      "Mango",
      'Uniqlo',
      'Forever 21',
      'Levi\'s',
      'Nike',
      'Adidas',
    ];
  }

  Future<List<Favorite>> getFavorites({
    int? id,
    int? sortId,
    List<String>? sizes,
    int? minvalue,
    int? maxValue,
    String? category,
    int? intmaxValue,
    List<Color>? colors,
    List<String>? brands,
  }) async {
    await Future.delayed(Duration(microseconds: 500));
    List<Favorite> filteredFavorites = favorites;
    List<Product> products = favorites.map((e) => e.product).toList();
    if (id != null) {
      products = products.where((e) => e.categoryData.id == id).toList();
    }

    if (sortId != null) {
      if (sortId == 0) {
        products = products.where((e) => e.newProduct == true).toList();
      }
      if (sortId == 1) {
        products.sort((a, b) => a.price.compareTo(b.price));
      }
      if (sortId == 2) {
        products.sort((a, b) => b.price.compareTo(a.price));
      }
      if (sortId == 3) {
        products.sort((a, b) => b.getRating.compareTo(a.getRating));
      }
    }

    if (category != null) {
      products = products.where((e) => e.category.contains(category)).toList();
    }

    if (colors != null && colors.isNotEmpty) {
      List<bool> temp = [];
      List<Product> tempProducts = [];
      for (var element in products) {
        for (var e in colors) {
          temp.add(element.colors.contains(e));
        }
        if (!temp.contains(false)) {
          tempProducts.add(element);
        }
        temp.clear();
      }
      products = tempProducts;
    }
    if (brands != null && brands.isNotEmpty) {
      products = products.where((e) => brands.contains(e.brand)).toList();
    }
    if (sizes != null && sizes.isNotEmpty) {
      List<bool> temp = [];
      List<Product> tempProducts = [];
      for (var element in products) {
        for (var e in sizes) {
          temp.add(element.sizes.contains(e));
        }
        if (!temp.contains(false)) {
          tempProducts.add(element);
        }
        temp.clear();
      }
      products = tempProducts;
    }
    if (minvalue != null && maxValue != null) {
      products =
          products
              .where((e) => e.price >= minvalue && e.price <= maxValue)
              .toList();
    }
    filteredFavorites =
        favorites.where((fav) => products.contains(fav.product)).toList();

    return filteredFavorites;
  }

  Future<void> updateFavorites(List<Favorite> products) async {
    await Future.delayed(Duration(microseconds: 600));
    favorites = products;
    print('count of favs');
    print(favorites.length);
  }
}
