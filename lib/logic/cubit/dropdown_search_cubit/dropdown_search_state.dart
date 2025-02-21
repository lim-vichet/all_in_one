part of 'dropdown_search_cubit.dart';

@immutable
abstract class DropdownSearchState {}

class DropdownSearchInitial extends DropdownSearchState {}

class PickedDropdownValue extends DropdownSearchState {
  final dynamic value;
  PickedDropdownValue(this.value);
}

class FilterResult extends DropdownSearchState {
  final List<dynamic> listResultFilter;
  FilterResult(this.listResultFilter);
}


// class LeaveBalancesState extends DropdownSearchState {
//   LeaveBalanceModel data;
//   LeaveBalancesState(this.data);
// }

class LeaveBalanceFail extends DropdownSearchState {}