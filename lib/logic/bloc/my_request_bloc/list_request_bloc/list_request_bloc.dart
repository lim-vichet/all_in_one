import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/my_request_model/list_request_model/list_request_model.dart';
import '../../../../data/repositories/my_request_repository/list_request_repo/list_request_repo.dart';
import '../../../../data/services/my_request_service/list_request_service/list_request_service.dart';

part 'list_request_event.dart';
part 'list_request_state.dart';

class ListRequestBloc extends Bloc<ListRequestEvent, ListRequestState> {
  ListRequestRepository listRequest = ListRequestService();
  ListRequestBloc() : super(ListRequestInitial()) {
    on<EventGetListRequest>((event, emit) async {
      emit(ListRequestLoading());
      var response = await listRequest.getListMyRequest(page: event.page, status: event.status, search: event.search);

      emit(
        response.fold(
            (l) => ListRequestError(),
            (r) =>ListRequestSuccess(resultListRequest: r.resultListRequest, page: event.page, totalPage: r.total)
        )
      );
    });


    on<GetLastDataListRequest>((event, emit) async {
      emit(ListRequestLoading());
      var response = await listRequest.getListMyRequest(page: event.page, status: event.status, search: event.search);

      emit(
          response.fold(
                  (l) => ListRequestError(),
                  (r) =>ListRequestSuccess(resultListRequest: event.oldData, page: event.page, totalPage: r.total).copyWith(r.resultListRequest, event.page)
          )
      );
    });

  }
}
