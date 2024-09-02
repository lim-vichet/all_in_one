part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class EventLogin extends LoginEvent{
  String phone ;
  String language;
  EventLogin({
    required this.phone,
    required this.language
});
}