import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/attendance_model/list_attendance_model/list_attendance_model.dart';
import '../../../../data/repositories/attendance_repository/list_attendance_repo/list_attendance_repo.dart';
import '../../../../data/services/attendance_service/list_attendance_service/list_attendance_service.dart';

part 'list_attendance_event.dart';
part 'list_attendance_state.dart';

class ListAttendanceBloc extends Bloc<ListAttendanceEvent, ListAttendanceState> {
  ListAttendanceRepo attendanceUserRepository = ListAttendanceService();
  ListAttendanceBloc() : super(ListAttendanceInitial()) {

    on<GetListAttendanceUserEvent>((event, emit) async {
      emit(ListAttendanceLoading());
      var response = await attendanceUserRepository.getListAttendance( fromDate: event.fromDate, toDate: event.toDate, page: event.page, userID: event.userID);
      emit(
          response.fold(
              (l) => ListAttendanceError(),
              (r) => ListAttendanceSuccess(fromDate: event.fromDate, toDate: event.toDate, page: event.page, totalPage: r.total, resultListAttendance: r.resultListAttendance)

          ));
    });

    on<GetLastDataAttendanceUserEvent>((event, emit) async {
      emit(ListAttendanceLoadingMore());
      var response = await attendanceUserRepository.getListAttendance( fromDate: event.fromDate, toDate: event.toDate, page: event.page, userID: event.userID);
      emit(
          response.fold(
              (l) => ListAttendanceError(),

              (r) => ListAttendanceSuccess( resultListAttendance:  event.oldData, fromDate: event.fromDate, toDate: event.toDate, page: event.page, totalPage: r.total, ).copyWith(r.resultListAttendance, event.page)
          )
      );

    });
  }
}
