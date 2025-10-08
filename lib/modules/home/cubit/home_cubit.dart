import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());

  void onIndexChanged(int selectedIndex) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}
