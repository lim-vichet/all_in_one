

import 'package:all_in_one/data/models/form_model/list_user_model.dart';
import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:all_in_one/data/repositories/form_repository/work_on_site_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/url_path.dart';
import '../main_services/base_api_service.dart';
import '../main_services/error_handler/network_error_handler.dart';

class ListUserService extends ListUserRepository{
  @override
  Future<Either<NetworkErrorModel, ListUserModel>> getListSuer() async {

    try {
      var response = await BaseAPIService().get(
        // attendancesByDate?date=17-10-2023
        // "${UrlPath.attendanceUser}/$idUser?fromDate=$dateTo&toDate=$dateFrom&page=$page&show=2",
        "${UrlPath.user}",
      );
      return Right(ListUserModel.fromJson(response));
    }
    on DioError catch (e) {
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