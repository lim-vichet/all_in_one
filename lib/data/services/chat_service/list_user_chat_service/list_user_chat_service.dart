
import 'package:all_in_one/data/models/chat_model/list_user_chat_model.dart';
import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:all_in_one/data/repositories/chat_repository/list_user_chat_repository/list_user_chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../utils/constants/url_path.dart';
import '../../../models/chat_model/list_user_chatting_model.dart';
import '../../main_services/base_api_service.dart';
import '../../main_services/error_handler/network_error_handler.dart';

class ListUserChatService extends ListUserChatRepository{
  @override
  Future<Either<NetworkErrorModel, ListUserChatModel>> GetListUserChatRepo({
    required int page,
    required String search,
    required String show}) async {
    try {var response = await BaseAPIService().get(
      // attendancesByDate?date=17-10-2023
      // "${UrlPath.attendanceUser}/$idUser?fromDate=$dateTo&toDate=$dateFrom&page=$page&show=2",
      "${UrlPath.employeeList}?show=10&search=$search&page=$page",
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
    return Right(ListUserChatModel.fromJson(response));
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