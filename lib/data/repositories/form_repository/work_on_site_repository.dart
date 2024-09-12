

import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:dartz/dartz.dart';

import '../../models/form_model/list_user_model.dart';

abstract class ListUserRepository{
  Future<Either<NetworkErrorModel, ListUserModel>> getListSuer();
}