part of 'list_user_chatting_bloc.dart';

@immutable
abstract class ListUserChattingState {}

class ListUserChattingInitial extends ListUserChattingState {}
class ListUserChattingLoading extends ListUserChattingState {}
class ListUserChattingError   extends ListUserChattingState {}
class ListUserChattingSuccess extends ListUserChattingState {
  List<ResultListChattingModel> resultListChattingModel;
  int page;
  int totalPage;
  ListUserChattingSuccess({
    required this.resultListChattingModel,
    required this.page,
    required this.totalPage
});

  ListUserChattingSuccess copyWith(List<ResultListChattingModel> newDataList, int page,) {
    return ListUserChattingSuccess(
      resultListChattingModel: List.from(resultListChattingModel)..addAll(newDataList),
      page: page,
      totalPage: totalPage,

    );
  }
}
