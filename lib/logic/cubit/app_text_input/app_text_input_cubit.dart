import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_text_input_state.dart';

class AppTextInputCubit extends Cubit<AppTextInputState> {
  AppTextInputCubit() : super(AppTextInputInitial());

  void removeError(String value){
    emit(RemoveErrorSuccess(value));
  }

}
