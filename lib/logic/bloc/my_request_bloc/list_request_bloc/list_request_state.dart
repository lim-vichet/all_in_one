part of 'list_request_bloc.dart';

@immutable
abstract class ListRequestState {}

class ListRequestInitial extends ListRequestState {}
class ListRequestLoading extends ListRequestState {}
class ListRequestError   extends ListRequestState {}
class ListRequestSuccess extends ListRequestState {
  List<ResultListRequest> resultListRequest;
  int page;
  int totalPage;
  ListRequestSuccess({
    required this.resultListRequest,
    required this.page,
    required this.totalPage
});

  ListRequestSuccess copyWith(List<ResultListRequest> newDataList, int page ){
    return ListRequestSuccess(
        resultListRequest: List.from(resultListRequest)..addAll(newDataList),
        page: page,
        totalPage: totalPage
    );
  }
}
