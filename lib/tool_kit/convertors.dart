import 'package:persian_number_utility/persian_number_utility.dart';

abstract class Convertors {
  //

  //1000000 => 1,000,000
  static String priceToText(int price) {
    return price.toString().seRagham();
  }
}
