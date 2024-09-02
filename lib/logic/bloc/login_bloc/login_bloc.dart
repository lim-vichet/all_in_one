import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/login_model/login_model.dart';
import '../../../data/repositories/login_repository/login_repository.dart';
import '../../../data/services/login_service/login_service.dart';
import '../../../utils/global_use.dart';
import '../../../utils/shared_preferences_service.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository = LoginService();
  LoginBloc() : super(LoginInitial()) {
    on<EventLogin>((event, emit) async {
      emit(LoginInLoading());
      var response = await repository.onLogin(phone: event.phone, language: event.language);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(response.fold(
              (l) => LoginInError(),
              (r) {
            SharedPreferencesService.instance?.setToken(r.accessToken);
            SharedPreferencesService.instance?.setUserId(r.userId.toString());
            SharedPreferencesService.instance?.setUserAddress(r.address.toString());
            SharedPreferencesService.instance?.setUserProfile(jsonEncode(r));
            // isNotLogin = false;
            // prefs.setString('informationUser',jsonEncode(r));
            return LoginInSuccess(phone: event.phone, loginData: r, language: event.language);
          }));
    });
  }
}
