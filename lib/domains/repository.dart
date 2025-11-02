import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/models/rating.dart';

class Repository {
  Future<List<CategoryData>> getCategories() async {
await    Future.delayed(Duration(milliseconds: 100));
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

  Future<List<Product>> getStreetClothes() async {
    Future.delayed(Duration(milliseconds: 120));
    return [];
  }

  Future<List<Product>> getSaleProducts() async {
   await Future.delayed(Duration(milliseconds: 120));
    final categories = await getCategories();
    return [
      Product(
        id: 403,
        off: 10,
        brand: "H&M",
        image: "assets/images/jeans3.png",
        title: "شلوار جین پسرانه پاره",
        category: "پسرانه",
        ratings: [
          Rating(rating: "طرح پاره خیلی جذابه", stars: 5),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 4),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 4),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 5),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 2),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 2),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 3),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 4),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 1),
        ],
        description:
            "شلوار جین راحت با طراحی پاره مدرن، مناسب استایل خیابانی و روزمره.",
        price: 69,
        categoryData: categories[4],
      ),
      Product(
        off: 15,
        id: 501,
        brand: "Zara",
        image: "assets/images/skirts1.png",
        title: "دامن پلیسه میدی",
        category: "زنانه",
        ratings: [
          Rating(rating: "خیلی شیک و خوش‌فرم", stars: 5),
          Rating(rating: "مناسب برای محل کار و استفاده روزانه", stars: 4),
        ],
        description:
            "دامن پلیسه‌دار با کمر بلند که هم برای موقعیت‌های رسمی و هم روزمره کاربرد داره.",
        price: 65,
        categoryData: categories[5],
      ),
      Product(
        off: 19,
        id: 502,
        brand: "H&M",
        image: "assets/images/skirts2.png",
        title: "دامن کوتاه جین",
        category: "زنانه",
        ratings: [
          Rating(rating: "شیک و مدرن", stars: 4),
          Rating(rating: "با کتانی خیلی خوب ست میشه", stars: 5),
        ],
        description:
            "دامن کوتاه از جنس جین با لبه‌های خام، مناسب استایل تابستانی و خیابانی.",
        price: 45,
        categoryData: categories[5],
      ),
      Product(
        off: 20,
        id: 503,
        brand: "Uniqlo",
        image: "assets/images/skirts3.png",
        title: "دامن بلند خط A",
        category: "زنانه",
        ratings: [
          Rating(rating: "راحت و پوشیده", stars: 5),
          Rating(rating: "جنس خیلی باکیفیت", stars: 4),
        ],
        description:
            "دامن بلند با برش خط A و پارچه نخی سبک، مناسب استایل‌های شیک و روزمره.",
        price: 75,
        categoryData: categories[5],
      ),
      Product(
        off: 33,
        id: 501,
        brand: "Zara",
        image: "assets/images/skirts1.png",
        title: "دامن پلیسه میدی",
        category: "زنانه",
        ratings: [
          Rating(rating: "خیلی شیک و خوش‌فرم", stars: 5),
          Rating(rating: "مناسب برای محل کار و استفاده روزانه", stars: 4),
        ],
        description:
            "دامن پلیسه‌دار با کمر بلند، مناسب برای استایل رسمی و کژوال.",
        price: 65,
        categoryData: categories[6],
      ),
    ];
  }

  Future<List<Product>> getNewProducts() async {
    Future.delayed(Duration(milliseconds: 120));
    final categories = await getCategories();
    return [
      Product(
        id: 202,
        newProduct: true,
        off: 10,
        brand: "Zara",
        image: "assets/images/knitwear2.png",
        title: "ژاکت بافت کوتاه",
        category: "مردانه",
        ratings: [
          Rating(rating: "مدرن و شیک", stars: 4),
          Rating(rating: "خیلی نرم و راحت", stars: 5),
        ],
        description:
            "ژاکت بافت کوتاه با دکمه در جلو، مناسب استایل‌های روزمره و نیمه‌رسمی.",
        price: 55,
        categoryData: categories[2],
      ),
      Product(
        id: 203,
        newProduct: true,
        brand: "Uniqlo",
        image: "assets/images/knitwear3.png",
        title: "پلیور یقه‌اسکی کلاسیک",
        category: "مردانه",
        ratings: [
          Rating(rating: "طراحی ساده و شیک", stars: 5),
          Rating(rating: "خیلی گرم و راحت", stars: 4),
        ],
        description:
            "پلیور یقه‌اسکی جذب از جنس پشم مرغوب، عالی برای پوشیدن زیر کت یا پالتو.",
        price: 79,
        categoryData: categories[2],
      ),
      Product(
        id: 301,
        newProduct: true,
        brand: "Zara",
        image: "assets/images/pants1.png",
        title: "شلوار دم‌پا گشاد با کمر بلند",
        category: "مردانه",
        ratings: [
          Rating(rating: "فیت عالی روی بدن", stars: 5),
          Rating(rating: "مناسب برای محل کار", stars: 4),
        ],
        description:
            "شلوار رسمی با کمر بلند و دم‌پا گشاد، مناسب برای استایل کاری و شیک.",
        price: 89,
        categoryData: categories[3],
      ),
      Product(
        id: 302,
        newProduct: true,
        brand: "H&M",
        image: "assets/images/pants2.png",
        title: "شلوار کتان جذب",
        category: "مردانه",
        ratings: [
          Rating(rating: "مناسب برای استفاده روزمره", stars: 4),
          Rating(rating: "جنسش خوب بود اما باب سلیقه‌م نبود", stars: 2),
        ],
        description:
            "شلوار کتان جذب با خاصیت کشسانی، مناسب برای استایل‌های نیمه‌رسمی.",
        price: 59,
        categoryData: categories[3],
      ),
      Product(
        id: 303,
        brand: "Uniqlo",
        newProduct: true,
        image: "assets/images/pants3.png",
        title: "شلوار کارگو کژوال",
        category: "مردانه",
        ratings: [
          Rating(rating: "خیلی کاربردی و مدرن", stars: 5),
          Rating(rating: "جیب‌های زیادی داره", stars: 3),
        ],
        description:
            "شلوار کارگو راحت با طراحی آزاد و جیب‌های زیاد، مناسب استایل خیابانی.",
        price: 65,
        categoryData: categories[3],
      ),
      Product(
        id: 401,
        newProduct: true,
        brand: "Levi's",
        image: "assets/images/jeans1.png",
        title: "شلوار جین راسته کلاسیک",
        category: "زنانه",
        ratings: [
          Rating(rating: "خیلی بادوام و راحت", stars: 5),
          Rating(rating: "مناسب استفاده روزمره", stars: 4),
        ],
        description:
            "شلوار جین راسته با پارچه مقاوم، مناسب برای استایل روزمره.",
        price: 99,
        categoryData: categories[4],
      ),
    ];
  }
}
