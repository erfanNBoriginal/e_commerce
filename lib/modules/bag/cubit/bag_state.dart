part of 'bag_cubit.dart';
enum ContentStatus{
  empty,
  filled,
  error
}
class BagState {
  final ContentStatus contentStatus;
  final List<BagItem> bagItems;
  final List<PromodCode> promoCodes;
  final bool loading;
  final PromodCode? selectedCode;
  final BagItem? bagItem;
  BagState.init()
    : bagItem = null,
    contentStatus = ContentStatus.empty,
      selectedCode = null,
      promoCodes = [],
      loading = false,
      bagItems = [];

  BagState({
    required this.contentStatus,
    required this.promoCodes,
    required this.selectedCode,
    required this.bagItem,
    required this.loading,
    required this.bagItems,
  });

  BagState copyWith({
    List<BagItem>? bagItems,
    List<PromodCode>? promoCodes,
    ContentStatus? contentStatus,
    bool? loading,
    PromodCode? selectedCode,
    BagItem? bagItem,
  }) {
    return BagState(
      loading: loading ?? this.loading,
      selectedCode: selectedCode ?? this.selectedCode,
      contentStatus: contentStatus ?? this.contentStatus,
      promoCodes: promoCodes ?? this.promoCodes,
      bagItem: bagItem ?? this.bagItem,
      bagItems: bagItems ?? this.bagItems,
    );
  }

  int getTotal() {
    int temp = 0;
    for (var e in bagItems) {
      temp += e.count * e.product.price;
    }
    return temp;
  }
}
