part of 'bag_cubit.dart';

class BagState {
  // final List<BagItem> tempItems;
  final List<BagItem> bagItems;
  final bool loading;

  BagState.init()
    : //: tempItems = [],
      loading = false,
      bagItems = [];

  BagState({
    required this.loading,
    required this.bagItems,
    //required this.tempItems
  });

  BagState copyWith({
    List<BagItem>? bagItems,
    bool? loading,
    // List<BagItem>? tempItems
  }) {
    return BagState(
      loading: loading ?? this.loading,
      bagItems: bagItems ?? this.bagItems,
      // tempItems: tempItems ?? this.tempItems,
    );
  }
}
