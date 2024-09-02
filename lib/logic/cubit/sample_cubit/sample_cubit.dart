import 'package:bloc/bloc.dart';

class SampleCubit extends Cubit<bool> {
  SampleCubit(bool initialState) : super(initialState);

  bool value = true;

  void onSampleChange() {
    value = !value;
    emit(value);
  }
}
