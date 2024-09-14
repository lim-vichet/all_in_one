import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/form_model/add_work_on_site_form_model.dart';
import '../../../../data/models/form_model/list_platnumber_model.dart';
import '../../../../data/models/form_model/list_ticketnumber_model.dart';
import '../../../../data/models/form_model/list_user_model.dart';
import '../../../../data/models/form_model/list_vehicle_type_model.dart';
import '../../../../data/models/upload_model/upload_model.dart';
import '../../../../data/repositories/form_repository/work_on_site_repository.dart';
import '../../../../data/services/form_service/work_on_site_service.dart';

part 'work_on_site_event.dart';
part 'work_on_site_state.dart';

class WorkOnSiteBloc extends Bloc<WorkOnSiteEvent, WorkOnSiteState> {
  ListUserRepository listUser = ListUserService();
  ListVehicleTypeRepository listVehicleType     = ListVehicleTypeService();
  ListTicketNumberRepository listTicketNumbers  = ListTicketNumberService();
  ListPlateNumberRepository listPlateNumbers   = ListPlateNumberService();

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

    on<EventGetListVehicleType>((event, emit) async {
      // emit(WorkOnSiteLoading());
      var resultListVehicle = await listVehicleType.getListVehicleType();
      emit(
          resultListVehicle.fold(
                  (l)=> WorkOnSiteError(),
                  (r)=> WorkOnSiteGetVehicleTypeSuccess(resultListVehicleType: r.resultListVehicleType, )
          )
      );
    });

    on<EventGetListTicketNumber>((event, emit) async {
      // emit(WorkOnSiteLoading());
      var listTicketNumber = await listTicketNumbers.getListTicketNumber();
      emit(
          listTicketNumber.fold(
                  (l)=> WorkOnSiteError(),
                  (r)=> WorkOnSiteGetListTicketNumberSuccess(resultListTicketNumber: r.resultListTicketNumber)
          )
      );
    });

    on<EventGetListPlateNumber>((event, emit) async {
      // emit(WorkOnSiteLoading());
      var listPlateNumber = await listPlateNumbers.getListPlateNumber(vehicleTypeId: event.vehicleTypeId);
      emit(
          listPlateNumber.fold(
                  (l)=> WorkOnSiteError(),
                  (r)=> WorkOnSiteGetListPlateNumberSuccess(resultListPlateNumber: r.resultListPlateNumber)
          )
      );
    });
  }
}
