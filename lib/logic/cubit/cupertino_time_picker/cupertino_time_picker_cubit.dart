import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cupertino_time_picker_state.dart';

class CupertinoTimePickerCubit extends Cubit<CupertinoTimePickerState> {
  CupertinoTimePickerCubit() : super(CupertinoTimePickerInitial());

  // event get value for dialog
  void eventGetValueTimePickerD (String value){
    emit(GetValueTimePickerDSuccess(value: value));
  }

  // event get value for bottom sheet
  void eventGetValueTimePickerBS (String value){
    emit(GetValueTimePickerBSSuccess(value: value));
  }

  void removeErrorAppPickerTBS(String value){
    emit(RemoveErrorAppPickerTBSSuccess(value));
  }

  void removeErrorAppPickerTD(String value){
    emit(RemoveErrorAppPickerTDSuccess(value));
  }
}
