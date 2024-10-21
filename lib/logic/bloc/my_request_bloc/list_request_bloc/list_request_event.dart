part of 'list_request_bloc.dart';

@immutable
abstract class ListRequestEvent {}

class EventGetListRequest extends ListRequestEvent{
  int page;
  String status;
  String search;
  EventGetListRequest({
    required this.page,
    required this.status,
    required this.search
  });
}

class GetLastDataListRequest extends ListRequestEvent{
  int page;
  String status;
  String search;
  List<ResultListRequest> oldData;
  GetLastDataListRequest({
    required this.page,
    required this.oldData,
    required this.status,
    required this.search
});
}
