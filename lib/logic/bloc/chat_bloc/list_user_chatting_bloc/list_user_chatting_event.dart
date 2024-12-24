part of 'list_user_chatting_bloc.dart';

@immutable
abstract class ListUserChattingEvent {}

class EventGetListUserChatting extends ListUserChattingEvent{
  int id;
  int page;
  String search;

  EventGetListUserChatting({
    required this.id,
    required this.page,
    required this.search
});
}

class EventLastGetListUserChatting extends ListUserChattingEvent{
  int id;
  int page;
  String search;
  List<ResultListChattingModel> oldData;

  EventLastGetListUserChatting({
    required this.id,
    required this.page,
    required this.search,
    required this.oldData
});
}