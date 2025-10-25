import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/promod_code.dart';

class BagRepo {
  List<BagItem> _bagItems = [];

  Future<List<BagItem>> getBagItems() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return _bagItems;
  }

  Future<List<PromodCode>> getPromoCodes() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return [
      PromodCode(
        image: 'assets/images/20off.png',
        remainingDays: '6 days',
        type: 'my personal offer',
        name: 'my promocode 2020',
        percent: 20,
      ),
      PromodCode(
        image: 'assets/images/10off.png',
        remainingDays: '22 days',
        type: 'summer sale',
        name: 'summer 2020',
        percent: 20,
      ),
      PromodCode(
        image: 'assets/images/15off.png',
        remainingDays: '15 days',
        type: 'new',
        name: 'new 2021',
        percent: 20,
      ),
    ];
  }

  Future<void> addToBag(List<BagItem> bagItems) async {
    Future.delayed(Duration(milliseconds: 1000));
    print('bagItems.length');
    _bagItems = bagItems;
    print(bagItems.length);
    for (var item in bagItems) {
      print(
        '${item.size} ${item.count} ${item.product.title} ${item.color!.a} ${item.color!.g} ${item.color!.b}',
      );
    }
  }

  List<BagItem> getTempItems() {
    return _bagItems;
  }
}
