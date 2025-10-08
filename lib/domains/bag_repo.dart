import 'package:e_commerce/domains/models/bag_item.dart';

class BagRepo {
  List<BagItem> _bagItems = [];

  void addTempItems(List<BagItem> items) {
    _bagItems = items;
    print(
      '${_bagItems[0].size} ${_bagItems[0].count} ${_bagItems[0].product.title}',
    );
  }

  Future<List<BagItem>> getBagItems() async {
    Future.delayed(Duration(milliseconds: 1000));
    return _bagItems;
  }

  Future<void> addToBag(List<BagItem> bagItems) async {
    Future.delayed(Duration(milliseconds: 1000));
    print('bagItems.length');
    print(bagItems.length);
    _bagItems = bagItems;
  }

  List<BagItem> getTempItems() {
    return _bagItems;
  }
}
