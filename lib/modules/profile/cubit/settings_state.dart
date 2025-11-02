part of 'settings_cubit.dart';
 
enum ContentStatus{
  empty,
  filled,
  error
}

class SettingsState {
final ContentStatus contentStatus;
final bool loading;
final OrderStatus orderStatus;
final Profile? profile;
  
SettingsState({
  required this.orderStatus,
  required this.contentStatus,
  required this.loading,
  required this.profile
});

SettingsState.init():
orderStatus= OrderStatus.processing,
profile = null,
loading = false,
contentStatus = ContentStatus.empty;


SettingsState copyWith({
  Profile? profile,
  bool? loading,
  OrderStatus? orderStatus,
ContentStatus? contentStatus
}){
  return SettingsState(
    profile: profile?? this.profile,
    orderStatus: orderStatus?? this.orderStatus,
    contentStatus: contentStatus?? this.contentStatus,
  loading: loading?? this.loading );
}

}