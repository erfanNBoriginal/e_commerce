import 'dart:ui';

import 'package:e_commerce/domains/models/product.dart';

class BagItem {
  final Product product;
  final Color? color;
  final String? size;
  final int count;
  BagItem({required this.product, this.count = 0, this.color, this.size});
}
