import 'package:e_commerce/domains/models/order.dart';

class Profile {

final String image ;
final String name ;
final String email ;
final List<Order> orders ;
 Profile({
 required this.image,
 required  this.name,
 required   this.email,
 required    this.orders});

}
