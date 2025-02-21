

import 'dart:developer';

import 'package:all_in_one/data/models/form_model/list_platnumber_model.dart';
import 'package:all_in_one/data/models/form_model/list_ticketnumber_model.dart';
import 'package:all_in_one/data/models/form_model/list_user_model.dart';
import 'package:all_in_one/data/models/form_model/list_vehicle_type_model.dart';
import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:all_in_one/data/repositories/form_repository/work_on_site_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/url_path.dart';
import '../../models/form_model/add_work_on_site_form_model.dart';
import '../../models/form_model/form_copy/get_list_user_assige_model.dart';
import '../../models/form_model/form_copy/plate_number_model.dart';
import '../../models/form_model/form_copy/ticket_model.dart';
import '../../models/form_model/form_copy/vehicle_model.dart';
import '../../models/form_model/form_copy/work_on_site_model.dart';
import '../../models/upload_model/upload_model.dart';
import '../main_services/base_api_service.dart';
import '../main_services/error_handler/network_error_handler.dart';


/// old Style
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

class ListVehicleTypeService extends ListVehicleTypeRepository{
  @override
  Future<Either<NetworkErrorModel, ListVehicleTypeModel>> getListVehicleType() async {
    try {
      var response = await BaseAPIService().get(
        // attendancesByDate?date=17-10-2023
        // "${UrlPath.attendanceUser}/$idUser?fromDate=$dateTo&toDate=$dateFrom&page=$page&show=2",
        "${UrlPath.vehicleTypes}",
      );
      return Right(ListVehicleTypeModel.fromJson(response));
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

class ListTicketNumberService extends ListTicketNumberRepository{
  @override
  Future<Either<NetworkErrorModel, ListTicketNumberModel>> getListTicketNumber() async {
    try {
      var response = await BaseAPIService().get(
        // attendancesByDate?date=17-10-2023
        // "${UrlPath.attendanceUser}/$idUser?fromDate=$dateTo&toDate=$dateFrom&page=$page&show=2",
        "${UrlPath.ticketNumber}",
      );
      return Right(ListTicketNumberModel.fromJson(response));
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

class ListPlateNumberService extends ListPlateNumberRepository{
  @override
  Future<Either<NetworkErrorModel, ListPlateNumberModel>> getListPlateNumber({required int vehicleTypeId}) async {
    try {
      var response = await BaseAPIService().get("${UrlPath.vehicleTypeByVehicleType}?vehicleTypeId=$vehicleTypeId");
      return Right(ListPlateNumberModel.fromJson(response));
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

class AddWorkOnSiteService extends AddWorkOnSiteFormRepository {

  @override
  Future<Either<NetworkErrorModel, AddWorkOnSiteFormModel>> addWorkOnSiteForm({
    required approver,
    required purposeOnside,
    required dateFrom,
    required timeFrom,
    required dateTo,
    required timeTo,
    required taskDescription,
    required locationOnside,
    required transportationType,
    required transportation,
    required workStatus,
    required workOnsideVehicleId,
    required ticketId,
    listResultFile
  }) async {
      try {
        var formData = FormData.fromMap({
          "approver": approver,
          "purposeOnside":purposeOnside,
          "dateFrom":dateFrom,
          "timeFrom":timeFrom,
          "dateTo":dateTo,
          "timeTo":timeTo,
          "taskDescription":taskDescription,
          "locationOnside":locationOnside,
          "transportationType":transportationType,
          "transportation":transportation,
          "workStatus":workStatus,
          "file": UploadModel.listMapFile(listResultFile),
          "workOnsideVehicleId": workOnsideVehicleId,
          "ticketId":ticketId,

        });
        log('formData.fields==============${formData.fields}');
        var response = await BaseAPIService().post(
            UrlPath.workOnSideForm,
            formData: formData
        );
        // print("---------------22222 $response");
        return Right(AddWorkOnSiteFormModel.fromJson(response));
      } on DioError catch(e) {
      var err = await NetworkErrorHandler().exec(e);
      return Left(NetworkErrorModel(title: err!.title, description: err!.description, statusCode: err!.statusCode));
    }
  }

}

/// old Style

/// New Style

class WorkOnSiteService extends WorkOnSiteRepo {
  @override
  Future<Either<NetworkErrorModel, WorkOnSiteModel>> postData({
    required approver,
    required purposeOnside,
    required dateFrom,
    required timeFrom,
    required dateTo,
    required timeTo,
    required taskDescription,
    required locationOnside,
    required transportationType,
    required transportation,
    required workStatus,
    required workOnsideVehicleId,
    required ticketId,
    listResultFile
  }) async {

    try {

      var formData = FormData.fromMap({

        "approver": approver,
        "purposeOnside":purposeOnside,
        "dateFrom":dateFrom,
        "timeFrom":timeFrom,
        "dateTo":dateTo,
        "timeTo":timeTo,
        "taskDescription":taskDescription,
        "locationOnside":locationOnside,
        "transportationType":transportationType,
        "transportation":transportation,
        "workStatus":workStatus,
        "file": UploadModel.listMapFile(listResultFile),
        "workOnsideVehicleId": workOnsideVehicleId,
        "ticketId":ticketId,

      });

      log("print-----service-----${formData.fields}");
      var response = await BaseAPIService().post(
          UrlPath.workOnSideForm,
          formData: formData
      );

      return Right(WorkOnSiteModel.fromJson(response));
    } on DioError catch(e) {
      var err = await NetworkErrorHandler().exec(e);
      return Left(NetworkErrorModel(
          title: err!.title,
          description: err!.description,
          statusCode: err!.statusCode
      ));
    }
  }

}

class GetListUserUserService extends GetListUserUserRepository {
  @override
  Future<Either<NetworkErrorModel, GetListUserApprovedModel>>
  getListUser() async {
    try {
      var response = await BaseAPIService().get(
          UrlPath.userAssign
      );
      return Right(GetListUserApprovedModel.fromJson(response));
    } on DioError catch (e) {
      var err = await NetworkErrorHandler().exec(e);
      return Left(NetworkErrorModel(
          title: err!.title,
          description: err!.description,
          statusCode: err!.statusCode
      ));
    }
  }
}

class VehicleService extends VehicleRepository {
  @override
  Future<Either<NetworkErrorModel, VehicleModel>> getVehicle() async {
    try {
      var response = await BaseAPIService().get(UrlPath.vehicle);

      return Right(VehicleModel.fromJson(response));
    } on DioError catch(e) {
      var err = await NetworkErrorHandler().exec(e);
      return Left(NetworkErrorModel(title: err!.title, description: err!.description, statusCode: err!.statusCode));
    }

  }

}

class TicketService extends TicketRepository {
  @override
  Future<Either<NetworkErrorModel, TicketModel>> getTicket() async {
    try {
      var response = await BaseAPIService().get("${UrlPath.ticket}?page=1&show=50");
      return Right(TicketModel.fromJson(response));
    } on DioError catch(e) {
      var err = await NetworkErrorHandler().exec(e);
      return Left(NetworkErrorModel(title: err!.title, description: err!.description, statusCode: err!.statusCode));
    }
  }

}

class PlateNumberService extends PlateNumberRepository {
  @override
  Future<Either<NetworkErrorModel, PlateNumberModel>> getPlateNumber(int id) async {
    try {
      var response = await BaseAPIService().get("${UrlPath.vehicleTypeByVehicleType}?vehicleTypeId=$id");
      return Right(PlateNumberModel.fromJson(response));
    } on DioError catch(e) {
      var err = await NetworkErrorHandler().exec(e);
      return Left(NetworkErrorModel(title: err!.title, description: err!.description, statusCode: err!.statusCode));
    }
  }
}