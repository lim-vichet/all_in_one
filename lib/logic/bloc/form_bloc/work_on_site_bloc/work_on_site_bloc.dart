import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/form_model/list_user_model.dart';
import '../../../../data/repositories/form_repository/work_on_site_repository.dart';
import '../../../../data/services/form_service/work_on_site_service.dart';

part 'work_on_site_event.dart';
part 'work_on_site_state.dart';

class WorkOnSiteBloc extends Bloc<WorkOnSiteEvent, WorkOnSiteState> {
  ListUserRepository listUser = ListUserService();
  WorkOnSiteBloc() : super(WorkOnSiteInitial()) {
    on<EventGetListUser>((event, emit) async {
      emit(WorkOnSiteLoading());
      var resultListUser = await listUser.getListSuer();
      emit(
        resultListUser.fold(
            (l)=> WorkOnSiteError(),
            (r)=> WorkOnSiteGetListUserSuccess(resultListUser: r.resultListUser)
        )
      );
    });
  }
}
