
import 'package:all_in_one/data/models/my_request_model/list_request_model/list_request_model.dart';
import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:all_in_one/data/repositories/my_request_repository/list_request_repo/list_request_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../utils/constants/url_path.dart';
import '../../main_services/base_api_service.dart';
import '../../main_services/error_handler/network_error_handler.dart';

class ListRequestService extends ListRequestRepository{
  @override
  Future<Either<NetworkErrorModel, ListMyRequestModel>> getListMyRequest({
    required int page,
    required String status,
    required String search
  }) async {
    try {
      var response = await BaseAPIService().get(
        // attendancesByDate?date=17-10-2023
        // "${UrlPath.attendanceUser}/$idUser?fromDate=$dateTo&toDate=$dateFrom&page=$page&show=2",
        "${UrlPath.listMyRequest}?status=$status&show=all&search=$search&page=1",
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
      return Right(ListMyRequestModel.fromJson(response));
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