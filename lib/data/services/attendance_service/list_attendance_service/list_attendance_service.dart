

import 'package:all_in_one/data/models/attendance_model/list_attendance_model/list_attendance_model.dart';
import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:all_in_one/data/repositories/attendance_repository/list_attendance_repo/list_attendance_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../utils/constants/url_path.dart';
import '../../main_services/base_api_service.dart';
import '../../main_services/error_handler/network_error_handler.dart';

class ListAttendanceService extends ListAttendanceRepo{
  @override
  Future<Either<NetworkErrorModel, ListAttendanceModel>> getListAttendance({
    required String fromDate,
    required String toDate,
    required int page,
    required int userID
  }) async {
    try {
      var response = await BaseAPIService().get(
        // attendancesByDate?date=17-10-2023
        // "${UrlPath.attendanceUser}/$idUser?fromDate=$dateTo&toDate=$dateFrom&page=$page&show=2",
        "${UrlPath.attendanceUser}/$userID?fromDate=$fromDate&toDate=$toDate&page=$page&show=5",
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
      return Right(ListAttendanceModel.fromJson(response));
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