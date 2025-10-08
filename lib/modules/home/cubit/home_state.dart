part of 'home_cubit.dart';

class HomeState {
  final int selectedIndex;

  HomeState.init() : selectedIndex = 0;

  HomeState({required this.selectedIndex});
  HomeState copyWith({int? selectedIndex}) {
    return HomeState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
