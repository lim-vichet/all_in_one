

import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:dartz/dartz.dart';

import '../../models/form_model/list_platnumber_model.dart';
import '../../models/form_model/list_ticketnumber_model.dart';
import '../../models/form_model/list_user_model.dart';
import '../../models/form_model/list_vehicle_type_model.dart';

abstract class ListUserRepository{
  Future<Either<NetworkErrorModel, ListUserModel>> getListSuer();
}

abstract class ListVehicleTypeRepository{
  Future<Either<NetworkErrorModel, ListVehicleTypeModel>> getListVehicleType();
}

abstract class ListTicketNumberRepository{
  Future<Either<NetworkErrorModel, ListTicketNumberModel>> getListTicketNumber();
}

abstract class ListPlateNumberRepository{
  Future<Either<NetworkErrorModel, ListPlateNumberModel>> getListPlateNumber({required int vehicleTypeId});
}