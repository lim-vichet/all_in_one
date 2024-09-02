import 'package:bloc/bloc.dart';

class SelectGenderCubit extends Cubit<String> {
  SelectGenderCubit(initialState) : super(initialState);

  String value = "Gender";

  void onSelectGender(String val) {
    value = val;
    emit(value);
  }
}