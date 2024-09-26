
import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:dartz/dartz.dart';

import '../../../models/my_request_model/list_request_model/list_request_model.dart';

abstract class ListRequestRepository{
  Future<Either<NetworkErrorModel, ListMyRequestModel>>getListMyRequest({
    required int page,
    required String status
  });
}