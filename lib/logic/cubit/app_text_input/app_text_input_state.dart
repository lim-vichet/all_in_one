part of 'app_text_input_cubit.dart';

@immutable
abstract class AppTextInputState {}

class AppTextInputInitial extends AppTextInputState {}

class RemoveErrorSuccess extends AppTextInputState {
  String error;
  RemoveErrorSuccess(this.error);
}
