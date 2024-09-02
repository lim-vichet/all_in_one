import 'package:bloc/bloc.dart';

class TextObsecureCubit extends Cubit<bool> {
  TextObsecureCubit(bool initialState) : super(initialState);

  bool isObsecure = true;

  void onObsecureChange() {
    isObsecure = !isObsecure;
    emit(isObsecure);
  }
}
