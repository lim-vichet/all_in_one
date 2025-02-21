
import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';
part 'select_fun_state.dart';

class SelectFunCubit extends Cubit<SelectFunState> {
  SelectFunCubit() : super(SelectFunInitial());

  void changeValue(dynamic value,int select) {
    switch(select) {
      case 0 :
        emit(ChangeValueState(value,select)); break;
      case 1 :
        emit(ChangeValueState(value,select)); break;
      case 2 :
        emit(ChangeValueState(value,select)); break;
      case 3 :
        emit(ChangeValueState(value,select)); break;
      case 4 :
        emit(ChangeValueState(value,select)); break;
    }
  }

  void selectValue({ required int id,required String name, int? code,String? position}){
    emit(SelectValueState(id,name,code,position));
  }

  void radioChange(String value) {
    emit(RadioValueState(value));
  }

  void search(String text, List<dynamic>? listItem) {
    List<dynamic> listResult = [];
    List<dynamic> listTmp = [];
    for ( var value in listItem! ) { listTmp.add(value); }
    for ( var value in listTmp ) {
      String searchName = value.nameTranTypeCompany.toLowerCase();
      if( searchName.contains(text) ) {
        listResult.add(value);
      }
    }
    emit(SearchState(listResult));
  }




  // LeaveBalanceRepo obj = LeaveBalanceService();
  // Future<void> getLeaveBalance(String id) async {
  //   var result = await obj.leaveBalance(id);
  //   emit(result.fold((l) => LeaveBalanceError(), (r) => LeaveBalanceData(r)));
  // }





}
