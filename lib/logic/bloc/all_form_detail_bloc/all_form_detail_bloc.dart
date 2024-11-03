import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/all_form_detail_model/work_on_site_detail_model.dart';
import '../../../data/repositories/all_form_detail_repository/all_form_detail_repository.dart';
import '../../../data/services/all_form_detail_service/all_form_detail_service.dart';

part 'all_form_detail_event.dart';
part 'all_form_detail_state.dart';

class AllFormDetailBloc extends Bloc<AllFormDetailEvent, AllFormDetailState> {
  final WorkOnSiteDetailRepository  _repositoryWorkOnSiteDetail    = WorkOnSiteDetailService();
  AllFormDetailBloc() : super(AllFormDetailInitial()) {
    on<EventGetFormWorkOnSiteDetail>((event, emit) async {
      emit(AllFormDetailLoading());

      var res = await _repositoryWorkOnSiteDetail.getDataWorkOnSiteDetail(id: event.id);
      emit(res.fold(
          (l) => AllFormDetailError(),
          (r) => FormWorkOnSiteDetailSuccess(resultFormWorkOnSiteDetail: r.resultFormWorkOnSiteDetail)
      ));
    });
  }
}
