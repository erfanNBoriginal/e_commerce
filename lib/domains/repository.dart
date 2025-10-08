import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/models/rating.dart';

class Repository {
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

  Future<List<Product>> getStreetClothes() async {
    Future.delayed(Duration(milliseconds: 120));
    return [];
  }

  Future<List<Product>> getSaleProducts() async {
    Future.delayed(Duration(milliseconds: 120));
    final categories = await getCategories();
    return [
      Product(
        id: 403,
        off: 10,
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
        off: 15,
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
        categoryData: categories[5],
      ),
      Product(
        off: 19,
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
        off: 20,
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
        off: 33,
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
    ];
  }

  Future<List<Product>> getNewProducts() async {
    Future.delayed(Duration(milliseconds: 120));
    final categories = await getCategories();
    return [
      // Product(
      //   newProduct: true,
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
        id: 202,
        newProduct: true,
        off: 10,
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
        newProduct: true,
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
        newProduct: true,
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
        newProduct: true,
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
        newProduct: true,
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
        newProduct: true,
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
    ];
  }
}
