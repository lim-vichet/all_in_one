

import 'package:all_in_one/data/models/network_error_model/network_error_model.dart';
import 'package:dartz/dartz.dart';

import '../../../models/attendance_model/list_attendance_model/list_attendance_model.dart';

abstract class ListAttendanceRepo {
  Future<Either<NetworkErrorModel, ListAttendanceModel>> getListAttendance({
    required String fromDate,
    required String toDate,
    required int page,
    required int userID
  });
}