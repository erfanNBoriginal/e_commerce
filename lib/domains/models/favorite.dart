import 'dart:ui';

import 'package:e_commerce/domains/models/product.dart';

class Favorite {
  final Product product;
  final String? size;
  final Color? color;

  Favorite({required this.product, this.size, this.color});
}
