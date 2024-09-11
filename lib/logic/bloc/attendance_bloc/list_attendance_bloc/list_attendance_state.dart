part of 'list_attendance_bloc.dart';

@immutable
abstract class ListAttendanceState {}

class ListAttendanceInitial     extends ListAttendanceState {}
class ListAttendanceLoading     extends ListAttendanceState {}
class ListAttendanceLoadingMore extends ListAttendanceState {}
class ListAttendanceError       extends ListAttendanceState {}
class ListAttendanceSuccess     extends ListAttendanceState {
  List<ResultListAttendance> resultListAttendance;
  String fromDate;
  String toDate;
  int page;
  int totalPage;

  ListAttendanceSuccess({
    required this.resultListAttendance,
    required this.fromDate,
    required this.toDate,
    required this.page,
    required this.totalPage
  });

  ListAttendanceSuccess copyWith(List<ResultListAttendance> newDataList, int page,) {
    return ListAttendanceSuccess(
      resultListAttendance: List.from(resultListAttendance)..addAll(newDataList),
      fromDate: fromDate,
      toDate: toDate,
      page: page,
      totalPage: totalPage,

    );
  }
}
