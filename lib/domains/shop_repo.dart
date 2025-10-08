import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/models/rating.dart';

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

  Future<CategoryData> getCategory(int id) async {
    Future.delayed(Duration(milliseconds: 100));
    final categories = await getCategories();
    return categories.firstWhere((e) => e.id == id);
  }

  Future<List<Product>> getProducts({int? id}) async {
    Future.delayed(Duration(milliseconds: 100));
    final categories = await getCategories();
    return [
      Product(
        id: 1,
        image: 'assets/images/image (1).jpg',
        title: 'pull over',
        description: 'description',
        price: 51,
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
        categoryData: categories[1],
        brand: 'zara',
        ratings: [Rating(rating: 'garbage product', stars: 3)],
      ),

      //  final CategoryData categories[0] = CategoryData(id: 1, title: 'Blouse');
      // Product(
      //   id: 101,
      //   brand: "Zara",
      //   image: "assets/images/blouse1.png",
      //   title: "Classic White Blouse",
      //   ratings: [
      //     Rating(rating: "Perfect for office wear", stars: 5),
      //     Rating(rating: "Good material", stars: 4),
      //   ],
      //   description:
      //       "A timeless white blouse with a slim fit, ideal for both office and casual wear.",
      //   price: 49,
      //   categoryData: categories[0],
      // ),
      Product(
        id: 102,
        brand: "H&M",
        image: "assets/images/blouse2.png",
        title: "Floral Print Blouse",
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
        id: 202,
        brand: "Zara",
        image: "assets/images/knitwear2.png",
        title: "Cropped Knit Cardigan",
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
        id: 301,
        brand: "Zara",
        image: "assets/images/pants1.png",
        title: "High-Waist Wide-Leg Pants",
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
        id: 401,
        brand: "Levi's",
        image: "assets/images/jeans1.png",
        title: "Classic Straight-Leg Jeans",
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
        ratings: [
          Rating(rating: "Comfortable and modest", stars: 5),
          Rating(rating: "Great fabric quality", stars: 4),
        ],
        description:
            "A-line maxi skirts made with lightweight cotton blend fabric, ideal for elegant casual wear.",
        price: 75,
        categoryData: categories[5],
      ),
      Product(
        id: 501,
        brand: "Zara",
        image: "assets/images/skirts1.png",
        title: "Pleated Midi Skirt",
        ratings: [
          Rating(rating: "Elegant and flowy", stars: 5),
          Rating(rating: "Perfect for office and casual", stars: 4),
        ],
        description:
            "A pleated midi skirts with a high waistline, versatile enough for both formal and casual occasions.",
        price: 65,
        categoryData: categories[6],
      ),
      Product(
        id: 502,
        brand: "H&M",
        image: "assets/images/skirts2.png",
        title: "Denim Mini Skirt",
        ratings: [
          Rating(rating: "Trendy and stylish", stars: 4),
          Rating(rating: "Pairs well with sneakers", stars: 5),
        ],
        description:
            "Casual denim mini skirts with a raw hem finish, perfect for summer streetwear looks.",
        price: 45,
        categoryData: categories[6],
      ),
      Product(
        id: 503,
        brand: "Uniqlo",
        image: "assets/images/skirts3.png",
        title: "A-Line Maxi Skirt",
        ratings: [
          Rating(rating: "Comfortable and modest", stars: 5),
          Rating(rating: "Great fabric quality", stars: 4),
        ],
        description:
            "A-line maxi skirts made with lightweight cotton blend fabric, ideal for elegant casual wear.",
        price: 75,
        categoryData: categories[6],
      ),
    ];
  }
}
