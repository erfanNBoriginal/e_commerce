import 'dart:ui';

import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/models/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopRepo {
  Future<List<CategoryData>> getCategories() async {
    await Future.delayed(Duration(milliseconds: 100));
    return [
      CategoryData(id: 1, title: 'بلوز'),
      CategoryData(id: 2, title: 'کت'),
      CategoryData(id: 3, title: 'بافت'),
      CategoryData(id: 4, title: 'شلوار'),
      CategoryData(id: 5, title: 'جین'),
      CategoryData(id: 6, title: 'دامن'),
      CategoryData(id: 7, title: 'لباس مجلسی'),
    ];
  }

  Future<void> updateProducts({Product? product, int? index}) async {
    await mainProducts(product: product, index: index);
  }

  Future<List<Product>> mainProducts({Product? product, int? index}) async {
    final categories = await getCategories();

    await Future.delayed(Duration(milliseconds: 50));
    List<Product> products = [
      Product(
        id: 1,
        image: 'assets/images/image (1).jpg',
        title: 'پلیور',
        description: 'توضیحات محصول',
        price: 51,
        category: 'زنانه',
        categoryData: categories[1],
        brand: 'Mango',
        ratings: [
          Rating(rating: 'محصول معمولی بود', stars: 3),
          Rating(rating: 'کیفیت متوسطی داشت', stars: 2),
        ],
      ),
      Product(
        id: 2,
        image: 'assets/images/image (4).jpg',
        title: 'بلوز',
        description: 'توضیحات محصول',
        price: 11,
        category: 'زنانه',
        categoryData: categories[1],
        brand: 'H&M',
        ratings: [Rating(rating: 'خوب بود اما خاص نبود', stars: 2)],
      ),
      Product(
        id: 3,
        image: 'assets/images/image.jpg',
        title: 'پیراهن',
        description: 'توضیحات محصول',
        price: 14,
        category: 'زنانه',
        categoryData: categories[1],
        brand: 'H&M',
        ratings: [Rating(rating: 'کیفیت پایینی داشت', stars: 1)],
      ),
      Product(
        id: 4,
        image: 'assets/images/image.png',
        title: 'شلوار',
        description: 'توضیحات محصول',
        price: 17,
        category: 'زنانه',
        categoryData: categories[1],
        brand: 'Zara',
        ratings: [Rating(rating: 'محصول بی‌کیفیت', stars: 3)],
      ),

      Product(
        id: 102,
        brand: "H&M",
        image: "assets/images/blouse2.png",
        title: "بلوز گل‌دار",
        category: "زنانه",
        ratings: [
          Rating(rating: "زیبا و راحت", stars: 5),
          Rating(rating: "رنگ‌ها خیلی زنده و جذاب هستن", stars: 4),
        ],
        description:
            "بلوزی سبک با طرح گلدار و آستین پفی، مناسب برای روزهای بهاری.",
        price: 39,
        categoryData: categories[0],
      ),
      Product(
        id: 103,
        brand: "Mango",
        image: "assets/images/blouse3.png",
        title: "بلوز ساتن ابریشمی",
        category: "زنانه",
        ratings: [
          Rating(rating: "خیلی شیک و مجلسی", stars: 5),
          Rating(rating: "کمی گرون اما ارزشش رو داره", stars: 4),
        ],
        description:
            "بلوزی لوکس از جنس ساتن ابریشم با سطحی براق، مناسب برای مجالس و مهمانی‌ها.",
        price: 79,
        categoryData: categories[0],
      ),
      Product(
        id: 104,
        brand: "Uniqlo",
        image: "assets/images/blouse4.png",
        title: "بلوز جین کژوال",
        category: "زنانه",
        ratings: [
          Rating(rating: "مدرن و خاص", stars: 4),
          Rating(rating: "جنس جین عالی", stars: 5),
        ],
        description:
            "بلوز جین دکمه‌دار با طراحی شیک، مناسب برای استایل روزمره با شلوار یا دامن.",
        price: 59,
        categoryData: categories[0],
      ),
      Product(
        id: 105,
        brand: "Forever 21",
        image: "assets/images/blouse5.png",
        title: "بلوز دکلته",
        category: "زنانه",
        ratings: [
          Rating(rating: "خیلی بامزه برای تابستون", stars: 5),
          Rating(rating: "کمی تنگ بود", stars: 3),
        ],
        description:
            "بلوزی مدرن با طراحی دکلته و فیت آزاد، مناسب روزهای گرم تابستانی.",
        price: 29,
        categoryData: categories[0],
      ),

      Product(
        id: 201,
        brand: "H&M",
        image: "assets/images/knitwear1.png",
        title: "پلیور ضخیم و آزاد",
        category: "مردانه",
        ratings: [
          Rating(rating: "خیلی گرم و راحت!", stars: 5),
          Rating(rating: "عالی برای زمستون", stars: 4),
        ],
        description:
            "پلیور ضخیم با بافت درشت و حس گرم و نرم، مناسب برای هوای سرد.",
        price: 69,
        categoryData: categories[2],
      ),
      Product(
        newProduct: true,
        id: 202,
        brand: "Zara",
        image: "assets/images/knitwear2.png",
        title: "ژاکت بافت کوتاه",
        category: "مردانه",
        ratings: [
          Rating(rating: "شیک و مدرن", stars: 4),
          Rating(rating: "پارچه نرم و راحت", stars: 5),
        ],
        description:
            "ژاکت بافت کوتاه با دکمه، مناسب استایل‌های روزمره و نیمه‌رسمی.",
        price: 55,
        categoryData: categories[2],
      ),
      Product(
        id: 203,
        brand: "Uniqlo",
        image: "assets/images/knitwear3.png",
        title: "یقه اسکی کلاسیک",
        category: "مردانه",
        ratings: [
          Rating(rating: "طراحی ساده و شیک", stars: 5),
          Rating(rating: "خیلی گرم و کاربردی", stars: 4),
        ],
        description:
            "پلیور یقه‌اسکی بافت نازک از ترکیب پشم، مناسب برای پوشیدن زیر کت یا پالتو.",
        price: 79,
        categoryData: categories[2],
      ),

      Product(
        newProduct: true,
        id: 301,
        brand: "Zara",
        image: "assets/images/pants1.png",
        title: "شلوار دم‌پا گشاد با کمر بلند",
        category: "مردانه",
        ratings: [
          Rating(rating: "استایل خیلی جذاب داره", stars: 5),
          Rating(rating: "مناسب برای محیط کاری", stars: 4),
        ],
        description:
            "شلوار رسمی با کمر بلند و دم‌پا گشاد، ایده‌آل برای استایل‌های شیک و کاری.",
        price: 89,
        categoryData: categories[3],
      ),
      Product(
        id: 302,
        brand: "H&M",
        image: "assets/images/pants2.png",
        title: "شلوار کتان اسلیم فیت",
        category: "مردانه",
        ratings: [
          Rating(rating: "مناسب استفاده روزمره", stars: 4),
          Rating(rating: "جنسش خوب بود ولی سلیقه من نبود", stars: 2),
        ],
        description:
            "شلوار کتان با فیت جذب و خاصیت کشسانی، مناسب استایل‌های روزانه و نیمه‌رسمی.",
        price: 59,
        categoryData: categories[3],
      ),
      Product(
        id: 303,
        brand: "Uniqlo",
        image: "assets/images/pants3.png",
        title: "شلوار کارگو راحت",
        category: "مردانه",
        ratings: [
          Rating(rating: "استایل خیابونی و کاربردی", stars: 5),
          Rating(rating: "جیب‌های زیاد داره", stars: 3),
        ],
        description:
            "شلوار کارگو با طراحی آزاد و جیب‌های متعدد، مناسب استایل کژوال و اسپرت.",
        price: 65,
        categoryData: categories[3],
      ),
      Product(
        newProduct: true,
        id: 401,
        brand: "Levi's",
        image: "assets/images/jeans1.png",
        title: "شلوار جین راسته کلاسیک",
        category: "مردانه",
        ratings: [
          Rating(rating: "بادوام و راحت", stars: 5),
          Rating(rating: "خیلی مناسب برای استفاده روزانه", stars: 4),
        ],
        description:
            "شلوار جین با برش راسته و پارچه مقاوم، مناسب استفاده روزمره.",
        price: 99,
        categoryData: categories[4],
      ),
      Product(
        id: 402,
        brand: "Zara",
        image: "assets/images/jeans2.png",
        title: "شلوار جین جذب با کمر بلند",
        category: "مردانه",
        ratings: [
          Rating(rating: "کشش عالی و راحت", stars: 4),
          Rating(rating: "فرم بدن رو خیلی خوب نشون میده", stars: 5),
        ],
        description: "شلوار جین جذب با کمر بلند و پارچه کشی، راحت و خوش‌فرم.",
        price: 79,
        categoryData: categories[4],
      ),
      Product(
        id: 403,
        brand: "H&M",
        image: "assets/images/jeans3.png",
        title: "شلوار جین پسرانه پاره",
        category: "پسرانه",
        ratings: [
          Rating(rating: "طرح پاره خیلی جذابه", stars: 5),
          Rating(
            rating: "با کتانی خیلی قشنگ میشه و روی پسرم خیلی شیک وایمیسه",
            stars: 4,
          ),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 4),
        ],
        description:
            "شلوار جین آزاد با طرح پاره و استایل خیابونی مدرن، مناسب جوانان.",
        price: 69,
        categoryData: categories[4],
      ),
      Product(
        id: 501,
        brand: "Zara",
        image: "assets/images/skirts1.png",
        title: "دامن پلیسه میدی",
        category: "زنانه",
        ratings: [
          Rating(rating: "خیلی شیک و خوش‌فرم", stars: 5),
          Rating(rating: "مناسب برای محل کار و استفاده روزانه", stars: 4),
        ],
        description: "دامن پلیسه‌دار با کمر بلند، مناسب استایل رسمی و کژوال.",
        price: 65,
        categoryData: categories[5],
      ),
      Product(
        id: 502,
        brand: "H&M",
        image: "assets/images/skirts2.png",
        title: "دامن جین کوتاه",
        category: "زنانه",
        ratings: [
          Rating(rating: "شیک و به‌روز", stars: 4),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 5),
        ],
        description:
            "دامن کوتاه از جنس جین با لبه‌های آزاد، مناسب استایل تابستانی و خیابانی.",
        price: 45,
        categoryData: categories[5],
      ),
      Product(
        id: 503,
        brand: "Uniqlo",
        image: "assets/images/skirts3.png",
        title: "دامن بلند خط A",
        category: "زنانه",
        ratings: [
          Rating(rating: "راحت و پوشیده", stars: 5),
          Rating(rating: "کیفیت پارچه عالیه", stars: 4),
        ],
        newProduct: true,
        description:
            "دامن بلند با برش A و پارچه سبک پنبه‌ای، مناسب استایل شیک و روزمره.",
        price: 75,
        categoryData: categories[5],
      ),
    ];

    if (product != null && index != null) {
      products.removeAt(index);
      products.insert(index, product);
    }
    return products;
  }

  Future<Product?> getProductById(int id) async {
    await Future.delayed(Duration(milliseconds: 1000));
    final products = await getProducts();
    return products.firstWhere((e) => e.id == id);
  }

  Future<CategoryData> getCategory(int id) async {
    await Future.delayed(Duration(milliseconds: 100));
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
    await Future.delayed(Duration(milliseconds: 100));
    List<Product> products = await mainProducts();
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
      products = products.where((e) => e.category == category).toList();
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
