

import 'package:all_in_one/data/models/all_form_detail_model/work_on_site_detail_model.dart';
import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:all_in_one/data/repositories/all_form_detail_repository/all_form_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/url_path.dart';
import '../main_services/base_api_service.dart';
import '../main_services/error_handler/network_error_handler.dart';

class WorkOnSiteDetailService extends WorkOnSiteDetailRepository{
  @override
  Future<Either<NetworkErrorModel, FormWorkOnSiteDetailModel>> getDataWorkOnSiteDetail({required int id}) async {
    try {
      var response = await BaseAPIService().get(
        // attendancesByDate?date=17-10-2023
        // "${UrlPath.attendanceUser}/$idUser?fromDate=$dateTo&toDate=$dateFrom&page=$page&show=2",
        "${UrlPath.requestVehicle}/$id",
      );
      if(response["message"]=="Unauthenticated."){
        return Left(
          NetworkErrorModel(
            title: "Unauthenticated",
            description: "Unauthenticated",
            statusCode: 401,
          ),
        );
      }
      return Right(FormWorkOnSiteDetailModel.fromJson(response));
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