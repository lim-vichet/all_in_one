import 'dart:async';

import 'package:all_in_one/data/services/chat_service/list_user_chat_service/list_user_chat_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/chat_model/list_user_chat_model.dart';
import '../../../../data/repositories/chat_repository/list_user_chat_repository/list_user_chat_repository.dart';

part 'list_user_chat_event.dart';
part 'list_user_chat_state.dart';

class ListUserChatBloc extends Bloc<ListUserChatEvent, ListUserChatState> {
  ListUserChatRepository _listUserChatRepository = ListUserChatService();
  ListUserChatBloc() : super(ListUserChatInitial()) {
    on<EventGetListUser>((event, emit) async {
      emit(ListUserChatLoading());
      var res = await _listUserChatRepository.GetListUserChatRepo(page: event.page, search: event.search, show: event.show);
      emit(res.fold(
          (l)=> ListUserChatError(),
          (r)=>ListUserChatSuccess(resultListUserChat: r.resultListUserChat)
      ));
    });
  }
}
