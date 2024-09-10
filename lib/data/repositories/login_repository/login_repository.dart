import 'package:dartz/dartz.dart';


import '../../models/login_email_model/login_email_model.dart';
import '../../models/login_model/login_model.dart';
import '../../models/network_error_model/network_error_model.dart';

abstract class LoginRepository{
  Future<Either<NetworkErrorModel ,UserInformationModel>> onLogin({
      required String phone,
      required String language
  });
}

abstract class LoginEmailRepo {
  Future<Either<NetworkErrorModel, EmailLoginModel>> postLoginEmail({
    required String email,
    required String password
  });
}
