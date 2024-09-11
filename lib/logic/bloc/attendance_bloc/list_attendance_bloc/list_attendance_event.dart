part of 'list_attendance_bloc.dart';

@immutable
abstract class ListAttendanceEvent {}

class GetListAttendanceUserEvent extends ListAttendanceEvent {
  int userID;
  String fromDate;
  String toDate;
  int page;

  GetListAttendanceUserEvent({
    required this.userID,
    required this.fromDate,
    required this.toDate,
    required this.page
  });
}

class GetLastDataAttendanceUserEvent extends ListAttendanceEvent {
  int userID;
  String fromDate;
  String toDate;
  int page;

  List<ResultListAttendance> oldData;

  GetLastDataAttendanceUserEvent({
    required this.userID,
    required this.fromDate,
    required this.toDate,
    required this.page,
    required this.oldData
  });
}