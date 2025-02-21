
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dropdown_search_state.dart';

class DropdownSearchCubit extends Cubit<DropdownSearchState> {
  DropdownSearchCubit() : super(DropdownSearchInitial());


  void filterText(String text,List<dynamic> listData) {
    List<dynamic> listTMP = [];
    List<dynamic> listResultFilter = [];

    String filterValue = text.replaceAll(" ","");
    filterValue = filterValue.toLowerCase();

    for ( var value in listData ) { listTMP.add(value); }
    for ( var element in listTMP ) {
        String valueData = element.nameTranTypeCompany.replaceAll(" ","");
        valueData = valueData.toLowerCase();
        if( valueData.contains(filterValue) ) {
          listResultFilter.add(element);
        }
    }
    emit(FilterResult(listResultFilter));
  }

  void pickValue(dynamic appDropdown) {
    emit(PickedDropdownValue(appDropdown));
  }

  // LeaveBalanceRepo obj = LeaveBalanceService();
  // Future<void> getLeaveBalance(String id) async {
  //   var result = await obj.leaveBalance(id);
  //   emit(result.fold((l) => LeaveBalanceFail(), (r) => LeaveBalancesState(r)));
  // }

}
