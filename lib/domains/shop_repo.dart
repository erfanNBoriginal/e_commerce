import 'dart:ui';

import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/models/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopRepo {
  Future<List<CategoryData>> getCategories() async {
    Future.delayed(Duration(milliseconds: 100));
    return [
      CategoryData(id: 1, title: 'blouse'),
      CategoryData(id: 2, title: 'Blazers'),
      CategoryData(id: 3, title: 'Knitwear'),
      CategoryData(id: 4, title: 'Pants'),
      CategoryData(id: 5, title: 'Jeans'),
      CategoryData(id: 6, title: 'Skirts'),
      CategoryData(id: 7, title: 'Dresses'),
    ];
  }

  Future<Product> getProductById(int id) async {
    Future.delayed(Duration(milliseconds: 100));
    final products = await getProducts();
    return products.firstWhere((e) => e.id == id);
  }

  Future<CategoryData> getCategory(int id) async {
    Future.delayed(Duration(milliseconds: 100));
    final categories = await getCategories();
    return categories.firstWhere((e) => e.id == id);
  }

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

  Future<List<Product>> getProducts({
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
    Future.delayed(Duration(milliseconds: 100));
    final categories = await getCategories();
    List<Product> products = [
      Product(
        id: 1,
        image: 'assets/images/image (1).jpg',
        title: 'pull over',
        description: 'description',
        price: 51,
        category: 'women',
        categoryData: categories[1],
        brand: 'Mango',
        ratings: [
          Rating(rating: 'sdadsd', stars: 3),
          Rating(rating: 'djfhnsd', stars: 2),
        ],
      ),
      Product(
        id: 2,
        image: 'assets/images/image (4).jpg',
        title: 'blouse',
        description: 'description',
        price: 11,
        category: 'women',
        categoryData: categories[1],
        brand: 'H&M',
        ratings: [Rating(rating: 'djfhnsd', stars: 2)],
      ),
      Product(
        id: 3,
        image: 'assets/images/image.jpg',
        title: 'shirt',
        description: 'description',
        price: 14,
        category: 'women',
        categoryData: categories[1],
        brand: 'H&M',
        ratings: [Rating(rating: 'djfhnsd', stars: 1)],
      ),
      Product(
        id: 4,
        image: 'assets/images/image.png',
        title: 'pants',
        description: 'description',
        price: 17,
        category: 'women',
        categoryData: categories[1],
        brand: 'zara',
        ratings: [Rating(rating: 'garbage product', stars: 3)],
      ),

      Product(
        id: 102,
        brand: "H&M",
        image: "assets/images/blouse2.png",
        title: "Floral Print Blouse",
        category: "women",
        ratings: [
          Rating(rating: "Beautiful and comfy", stars: 5),
          Rating(rating: "Colors are vibrant", stars: 4),
        ],
        description:
            "Lightweight floral blouse with puff sleeves, perfect for spring outings.",
        price: 39,
        categoryData: categories[0],
      ),
      Product(
        id: 103,
        brand: "Mango",
        image: "assets/images/blouse3.png",
        title: "Silk Satin Blouse",
        category: "women",
        ratings: [
          Rating(rating: "Very elegant", stars: 5),
          Rating(rating: "A bit pricey but worth it", stars: 4),
        ],
        description:
            "Luxurious silk satin blouse with a smooth finish, perfect for evening wear.",
        price: 79,
        categoryData: categories[0],
      ),
      Product(
        id: 104,
        brand: "Uniqlo",
        image: "assets/images/blouse4.png",
        title: "Casual Denim Blouse",
        category: "women",
        ratings: [
          Rating(rating: "Trendy and unique", stars: 4),
          Rating(rating: "Good quality denim", stars: 5),
        ],
        description:
            "Stylish denim blouse with button-down design, pairs well with jeans or skirts.",
        price: 59,
        categoryData: categories[0],
      ),
      Product(
        id: 105,
        brand: "Forever 21",
        image: "assets/images/blouse5.png",
        title: "Off-Shoulder Blouse",
        category: "women",
        ratings: [
          Rating(rating: "Super cute for summer", stars: 5),
          Rating(rating: "Runs a bit small", stars: 3),
        ],
        description:
            "Trendy off-shoulder blouse with a relaxed fit, ideal for summer days.",
        price: 29,
        categoryData: categories[0],
      ),

      Product(
        id: 201,
        brand: "H&M",
        image: "assets/images/knitwear1.png",
        title: "Chunky Oversized Sweater",
        category: "men",
        ratings: [
          Rating(rating: "Super warm and comfy!", stars: 5),
          Rating(rating: "Perfect for winter", stars: 4),
        ],
        description:
            "A thick oversized knit sweater with a cozy feel, perfect for layering in cold weather.",
        price: 69,
        categoryData: categories[2],
      ),
      Product(
        newProduct: true,
        id: 202,
        brand: "Zara",
        image: "assets/images/knitwear2.png",
        title: "Cropped Knit Cardigan",
        category: "men",
        ratings: [
          Rating(rating: "Trendy and stylish", stars: 4),
          Rating(rating: "Soft fabric", stars: 5),
        ],
        description:
            "A modern cropped cardigan with button closure, great for casual and semi-formal looks.",
        price: 55,
        categoryData: categories[2],
      ),
      Product(
        id: 203,
        brand: "Uniqlo",
        image: "assets/images/knitwear3.png",
        title: "Classic Turtleneck Pullover",
        category: "men",
        ratings: [
          Rating(rating: "Timeless design", stars: 5),
          Rating(rating: "Keeps you warm", stars: 4),
        ],
        description:
            "Slim fit turtleneck knit pullover made with fine wool blend, ideal for layering.",
        price: 79,
        categoryData: categories[2],
      ),

      Product(
        newProduct: true,
        id: 301,
        brand: "Zara",
        image: "assets/images/pants1.png",
        title: "High-Waist Wide-Leg Pants",
        category: "men",
        ratings: [
          Rating(rating: "Super flattering fit", stars: 5),
          Rating(rating: "Good for office wear", stars: 4),
        ],
        description:
            "Elegant high-waist pants with a wide-leg cut, perfect for formal and smart-casual looks.",
        price: 89,
        categoryData: categories[3],
      ),
      Product(
        id: 302,
        brand: "H&M",
        image: "assets/images/pants2.png",
        title: "Slim Fit Chino Pants",
        category: "men",
        ratings: [
          Rating(rating: "Great everyday wear", stars: 4),
          Rating(rating: "Comfortable material, but not my type", stars: 2),
        ],
        description:
            "Classic slim fit chino pants made with stretch cotton, versatile for casual and semi-formal outfits.",
        price: 59,
        categoryData: categories[3],
      ),
      Product(
        id: 303,
        brand: "Uniqlo",
        image: "assets/images/pants3.png",
        title: "Casual Cargo Pants",
        category: "men",
        ratings: [
          Rating(rating: "Stylish and practical", stars: 5),
          Rating(rating: "Lots of pockets", stars: 3),
        ],
        description:
            "Trendy cargo pants with multiple utility pockets and a relaxed fit for casual streetwear style.",
        price: 65,
        categoryData: categories[3],
      ),
      Product(
        newProduct: true,
        id: 401,
        brand: "Levi's",
        image: "assets/images/jeans1.png",
        title: "Classic Straight-Leg Jeans",
        category: "women",
        ratings: [
          Rating(rating: "Durable and comfy", stars: 5),
          Rating(rating: "Perfect everyday jeans", stars: 4),
        ],
        description:
            "Timeless straight-leg jeans made with durable denim, ideal for casual wear.",
        price: 99,
        categoryData: categories[4],
      ),
      Product(
        id: 402,
        brand: "Zara",
        image: "assets/images/jeans2.png",
        title: "High-Rise Skinny Jeans",
        category: "women",
        ratings: [
          Rating(rating: "Great stretch fit", stars: 4),
          Rating(rating: "Very flattering", stars: 5),
        ],
        description:
            "Skinny jeans with a high-rise waist and stretchy material for maximum comfort.",
        price: 79,
        categoryData: categories[4],
      ),
      Product(
        id: 403,
        brand: "H&M",
        image: "assets/images/jeans3.png",
        title: "Relaxed Fit Ripped Jeans",
        category: "boys",
        ratings: [
          Rating(rating: "Trendy ripped design", stars: 5),
          Rating(rating: "Looks great with sneakers", stars: 4),
        ],
        description:
            "Casual relaxed-fit jeans featuring a distressed ripped style for a modern streetwear look.",
        price: 69,
        categoryData: categories[4],
      ),
      Product(
        id: 501,
        brand: "Zara",
        image: "assets/images/skirts1.png",
        title: "Pleated Midi Skirt",
        category: "women",
        ratings: [
          Rating(rating: "Elegant and flowy", stars: 5),
          Rating(rating: "Perfect for office and casual", stars: 4),
        ],
        description:
            "A pleated midi skirt with a high waistline, versatile enough for both formal and casual occasions.",
        price: 65,
        categoryData: categories[5],
      ),
      Product(
        id: 502,
        brand: "H&M",
        image: "assets/images/skirts2.png",
        title: "Denim Mini Skirt",
        category: "women",
        ratings: [
          Rating(rating: "Trendy and stylish", stars: 4),
          Rating(rating: "Pairs well with sneakers", stars: 5),
        ],
        description:
            "Casual denim mini skirts with a raw hem finish, perfect for summer streetwear looks.",
        price: 45,
        categoryData: categories[5],
      ),
      Product(
        id: 503,
        brand: "Uniqlo",
        image: "assets/images/skirts3.png",
        title: "A-Line Maxi Skirt",
        category: "women",
        ratings: [
          Rating(rating: "Comfortable and modest", stars: 5),
          Rating(rating: "Great fabric quality", stars: 4),
        ],
        newProduct: true,
        description:
            "A-line maxi skirts made with lightweight cotton blend fabric, ideal for elegant casual wear.",
        price: 75,
        categoryData: categories[5],
      ),
    ];
    if (id != null) {
      products = products.where((e) => e.categoryData.id == id).toList();
    }
    if (sortId != null) {
      if (sortId == 0) {
        print('newset');
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
      print('category');
      print(category);
      products = products.where((e) => e.category.contains(category)).toList();
    }

    if (colors != null && colors.isNotEmpty) {
      print('colors');
      List<bool> temp = [];
      List<Product> tempProducts = [];
      for (var element in products) {
        for (var e in colors) {
          print('sizes.contains(e)');
          print('${element.colors.contains(e)} $e');
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
      print('brands');
      products = products.where((e) => brands.contains(e.brand)).toList();
    }
    if (sizes != null && sizes.isNotEmpty) {
      print('sizes');
      List<bool> temp = [];
      List<Product> tempProducts = [];
      for (var element in products) {
        for (var e in sizes) {
          print('sizes.contains(e)');
          print('${element.sizes.contains(e)} $e');
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
      print('minvalue');
      products =
          products
              .where((e) => e.price >= minvalue && e.price <= maxValue)
              .toList();
    }
    print('products.length final');
    print(products.length);

    return products;
  }
}
