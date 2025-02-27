part of 'list_user_chat_bloc.dart';

@immutable
abstract class ListUserChatEvent {}

class EventGetListUser extends ListUserChatEvent{
  int page;
  String search;
  String show;
  EventGetListUser({
    required this.page,
    required this.search,
    required this.show
  });
}