import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/chat_model/list_user_chatting_model.dart';
import '../../../../data/repositories/chat_repository/list_user_chatting_repository/list_user_chatting_repository.dart';
import '../../../../data/services/chat_service/list_user_chatting_service/list_user_chatting_service.dart';

part 'list_user_chatting_event.dart';
part 'list_user_chatting_state.dart';

class ListUserChattingBloc extends Bloc<ListUserChattingEvent, ListUserChattingState> {
  ListUserChattingRepository _repositoryListUserChat = ListUserChattingService();
  ListUserChattingBloc() : super(ListUserChattingInitial()) {
    on<EventGetListUserChatting>((event, emit) async {
       emit(ListUserChattingLoading());
       var res = await _repositoryListUserChat.getListUserChatting(id: event.id, page: event.page, search: event.search);

       emit(res.fold(
           (l)=>ListUserChattingError(),
           (r)=>ListUserChattingSuccess(resultListChattingModel: r.resultListChattingModel, page: event.page, totalPage: r.total)
       ));
    });


    on<EventLastGetListUserChatting>((event, emit) async {
      emit(ListUserChattingLoading());
      var res = await _repositoryListUserChat.getListUserChatting(id: event.id, page: event.page, search: event.search);

      emit(res.fold(
              (l)=>ListUserChattingError(),
              (r)=>ListUserChattingSuccess(resultListChattingModel: event.oldData, page: event.page, totalPage: r.total).copyWith(r.resultListChattingModel, event.page)
      ));
    });
  }
}
