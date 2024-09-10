import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/login_email_model/login_email_model.dart';
import '../../../data/models/login_model/login_model.dart';
import '../../../data/repositories/login_email_repository/login_email_repository.dart';
import '../../../data/repositories/login_repository/login_repository.dart';
import '../../../data/services/login_email_service/login_email_service.dart';
import '../../../data/services/login_service/login_service.dart';
import '../../../utils/global_use.dart';
import '../../../utils/shared_preferences_service.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository = LoginService();
  LoginEmailRepo loginEmail = LoginEmailService();
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
            // SharedPreferencesService.instance?.setUserAddress(r.address.toString());
            SharedPreferencesService.instance?.setUserProfile(jsonEncode(r));
            // isNotLogin = false;
            // prefs.setString('informationUser',jsonEncode(r));
            return LoginInSuccess(phone: event.phone, loginData: r, language: event.language);
          }));
    });

    on<EventLoginEmail>((event, emit) async {

      StaffEmailLogin staffEmailLogin;

      // String phone      = event.email;
      // String phoneRequired  = "";
      //
      // String password   = event.password;
      // String passwordRequired  = "";
      //
      // if( phone.isEmpty ) phoneRequired        = AppValidation().validate("The field email is required!".tr);
      // if( password.isEmpty ) passwordRequired  = AppValidation().validate("The field password is required!".tr);
      //
      // if( phone.isEmpty || password.isEmpty ) {
      //   emit(LoginValidation(emailRequired: phoneRequired, passwordRequired: passwordRequired));
      //   return;
      // }

      emit(LoginInLoading());

      var response = await loginEmail.postLoginEmail(email: event.email, password: event.password);
      emit(response.fold(
              (l) => LoginInError(),
              (r) {
            staffEmailLogin = StaffEmailLogin(
              replace: r.staffEmailLogin[0].replace,
              id: r.staffEmailLogin[0].id,
              contact: r.staffEmailLogin[0].contact,
              nameEn: r.staffEmailLogin[0].nameEn,
              nameKh: r.staffEmailLogin[0].nameKh,
              email: r.staffEmailLogin[0].email,
              cid: r.staffEmailLogin[0].cid,
              gender: r.staffEmailLogin[0].gender,
              position: r.staffEmailLogin[0].position,
              positionKh: r.staffEmailLogin[0].positionKh,
              department: r.staffEmailLogin[0].department,
              departmentKh: r.staffEmailLogin[0].departmentKh,
              profile: r.staffEmailLogin[0].profile,
              dob: r.staffEmailLogin[0].dob,
              joinDate: r.staffEmailLogin[0].joinDate,
              fulladdressKh: r.staffEmailLogin[0].fulladdressKh,
              fulladdressEn:  r.staffEmailLogin[0].fulladdressEn,


              // userRole: r.resultstafflogin[0].userRole,
            );
            SharedPreferencesService.instance?.setUserProfile(jsonEncode(staffEmailLogin));
            var data = SharedPreferencesService.instance?.getUserProfile;
            // print("lllllll ${jsonDecode(data!)}");
            SharedPreferencesService.instance?.setToken(r.accessToken);
            SharedPreferencesService.instance?.setUserId("${r.maUserId}");
            SharedPreferencesService.instance?.setUserRole("E-Mail");
            return LoginEmailSuccess( staffEmailLogin: r.staffEmailLogin);
          }
      )
      );
    });
  }
}
