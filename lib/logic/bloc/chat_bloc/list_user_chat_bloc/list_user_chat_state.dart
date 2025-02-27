part of 'list_user_chat_bloc.dart';

@immutable
abstract class ListUserChatState {}

class ListUserChatInitial extends ListUserChatState {}
class ListUserChatLoading extends ListUserChatState {}
class ListUserChatError   extends ListUserChatState {}
class ListUserChatSuccess extends ListUserChatState {
  List<ResultListUserChat> resultListUserChat;
  ListUserChatSuccess({required this.resultListUserChat} );
}