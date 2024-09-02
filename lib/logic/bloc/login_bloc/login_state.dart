part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial   extends LoginState {}
class LoginInError   extends LoginState {}
class LoginInLoading extends LoginState {}
class LoginInSuccess extends LoginState {
  String phone;
  String language;
  UserInformationModel loginData;
  LoginInSuccess({
    required this.phone,
    required this.loginData,
    required this.language
 });
}
