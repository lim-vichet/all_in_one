part of 'select_fun_cubit.dart';

@immutable
abstract class SelectFunState {}

class SelectFunInitial extends SelectFunState {}
class ChangeValueState extends SelectFunState {
  dynamic value;
  int code;
  ChangeValueState(this.value,this.code);
}
class RadioValueState extends SelectFunState {
  String value;
  RadioValueState(this.value);
}

// class LeaveBalanceData extends SelectFunState {
//   LeaveBalanceModel data;
//   LeaveBalanceData(this.data);
// }

class LeaveBalanceError extends SelectFunState {

}

class SearchState extends SelectFunState {
  List<dynamic> resultSearch;
  SearchState(this.resultSearch);
}


class SelectValueState extends SelectFunState {
  int id;
  String name;
  int? code;
  String? position;
  SelectValueState(this.id,this.name,this.code,this.position);
}

class MissionPermitSelect extends SelectFunState {
  String id;
  String request_code;
  MissionPermitSelect(this.id,this.request_code);
}


class PickedDropdownValueState extends SelectFunState {
  final dynamic value;
  PickedDropdownValueState(this.value);
}




