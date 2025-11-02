import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/order.dart';
import 'package:e_commerce/domains/models/profile.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:overlay_support/overlay_support.dart';

class SettingsRepo {

Profile? profile = Profile(
  bankCards: [],
   addresses: [],
    promoCodes: [],
     image: U.Icons.activeStar,
      name: 'Erfan',
       email: 'erfannobahar83@gmail.com',
        orderedItems: []);


Future<Profile?> getProfile()async{
     await Future.delayed(Duration(milliseconds: 120));
    return profile;
}

Future<void> addOrder(Order order)async{
     await Future.delayed(Duration(milliseconds: 1200));
  profile?.orderedItems.add(order);
}

}