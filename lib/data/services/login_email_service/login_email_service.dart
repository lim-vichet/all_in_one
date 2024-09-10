//
//
// import 'dart:developer';
//
// import 'package:all_in_one/data/models/login_email_model/login_email_model.dart';
// import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
//
// import '../../../utils/constants/url_path.dart';
// import '../../repositories/login_repository/login_repository.dart';
// import '../main_services/base_api_service.dart';
// import '../main_services/error_handler/network_error_handler.dart';
//
// class LoginEmailService extends LoginEmailRepo{
//   @override
//   Future<Either<NetworkErrorModel, EmailLoginModel>> postLoginEmail({required String email, required String password}) async {
//     try {
//       var response = await BaseAPIService().post(
//           UrlPath.login,
//           body:{
//             "email" : email,
//             "password" : password,
//           }
//       );
//       log("message-------${response}");
//       return Right(EmailLoginModel.fromJson(response));
//     } on DioException catch (e) {
//       var error = await NetworkErrorHandler().exec(e);
//       return Left(
//         NetworkErrorModel(
//           title: error!.title,
//           description: error.description,
//           statusCode: error.statusCode,
//         ),
//       );
//     }
//   }
// }