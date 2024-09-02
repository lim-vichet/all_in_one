import 'package:dartz/dartz.dart';


import '../../models/login_model/login_model.dart';
import '../../models/network_error_model/network_error_model.dart';

abstract class LoginRepository{
  Future<Either<NetworkErrorModel ,UserInformationModel>> onLogin({
      required String phone,
      required String language
  });
}
