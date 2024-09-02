
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../../utils/constants/url_path.dart';
import '../../models/login_model/login_model.dart';
import '../../models/network_error_model/network_error_model.dart';
import '../../repositories/login_repository/login_repository.dart';
import '../main_services/base_api_service.dart';
import '../main_services/error_handler/network_error_handler.dart';

class LoginService extends LoginRepository{
  @override
  Future<Either<NetworkErrorModel, UserInformationModel>> onLogin({required String phone, required String language}) async {
    try {
      var response = await BaseAPIService().post(
          UrlPath.login,
          body:{
            "phone" : phone,
            "language" : language,

          }
      );
      log("message-------${response}");
      return Right(UserInformationModel.fromJson(response));
    } on DioException catch (e) {
      var error = await NetworkErrorHandler().exec(e);
      return Left(
        NetworkErrorModel(
          title: error!.title,
          description: error.description,
          statusCode: error.statusCode,
        ),
      );
    }
  }
}