import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/form_model/add_work_on_site_form_model.dart';
import '../../../../data/models/form_model/form_copy/get_list_user_assige_model.dart';
import '../../../../data/models/form_model/form_copy/plate_number_model.dart';
import '../../../../data/models/form_model/form_copy/ticket_model.dart';
import '../../../../data/models/form_model/form_copy/vehicle_model.dart';
import '../../../../data/models/form_model/form_copy/work_on_site_model.dart';
import '../../../../data/models/form_model/list_platnumber_model.dart';
import '../../../../data/models/form_model/list_ticketnumber_model.dart';
import '../../../../data/models/form_model/list_user_model.dart';
import '../../../../data/models/form_model/list_vehicle_type_model.dart';
import '../../../../data/models/upload_model/upload_model.dart';
import '../../../../data/repositories/form_repository/work_on_site_repository.dart';
import '../../../../data/services/form_service/work_on_site_service.dart';
import '../../../../utils/constants/app_field_required.dart';
import '../../../../utils/dropdown_global.dart';

part 'work_on_site_event.dart';
part 'work_on_site_state.dart';

/// old Style
// class WorkOnSiteBloc extends Bloc<WorkOnSiteEvent, WorkOnSiteState> {
//   ListUserRepository          listUser           = ListUserService();
//   ListVehicleTypeRepository   listVehicleType    = ListVehicleTypeService();
//   ListTicketNumberRepository  listTicketNumbers  = ListTicketNumberService();
//   ListPlateNumberRepository   listPlateNumbers   = ListPlateNumberService();
//   AddWorkOnSiteFormRepository addWorkOnSite      = AddWorkOnSiteService();
//
//   WorkOnSiteBloc() : super(WorkOnSiteInitial()) {
//     on<EventGetListUser>((event, emit) async {
//       emit(WorkOnSiteLoading());
//       var resultListUser = await listUser.getListSuer();
//       emit(
//         resultListUser.fold(
//             (l)=> WorkOnSiteError(),
//             (r)=> WorkOnSiteGetListUserSuccess(resultListUser: r.resultListUser)
//         )
//       );
//     });
//
//     on<EventGetListVehicleType>((event, emit) async {
//       emit(WorkOnSiteLoading());
//       var resultListVehicle = await listVehicleType.getListVehicleType();
//       emit(
//           resultListVehicle.fold(
//                   (l)=> WorkOnSiteError(),
//                   (r)=> WorkOnSiteGetVehicleTypeSuccess(resultListVehicleType: r.resultListVehicleType, )
//           )
//       );
//     });
//
//     on<EventGetListTicketNumber>((event, emit) async {
//       // emit(WorkOnSiteLoading());
//       var listTicketNumber = await listTicketNumbers.getListTicketNumber();
//       emit(
//           listTicketNumber.fold(
//                   (l)=> WorkOnSiteError(),
//                   (r)=> WorkOnSiteGetListTicketNumberSuccess(resultListTicketNumber: r.resultListTicketNumber)
//           )
//       );
//     });
//
//     on<EventGetListPlateNumber>((event, emit) async {
//       // emit(WorkOnSiteLoading());
//       var listPlateNumber = await listPlateNumbers.getListPlateNumber(vehicleTypeId: event.id);
//       emit(
//           listPlateNumber.fold(
//                   (l)=> WorkOnSiteError(),
//                   (r)=> WorkOnSiteGetListPlateNumberSuccess(resultListPlateNumber: r.resultListPlateNumber)
//           )
//       );
//     });
//
//
//     on<EventAddWorkOnSiteForm>((event, emit) async {
//       emit(WorkOnSiteLoading());
//       var response = await addWorkOnSite.addWorkOnSiteForm(
//           approver: event.approver,
//           purposeOnside: event.purposeOnside,
//           dateFrom: event.dateFrom,
//           timeFrom: event.timeFrom,
//           dateTo: event.dateTo,
//           timeTo: event.timeTo,
//           taskDescription: event.taskDescription,
//           locationOnside: event.locationOnside,
//           transportationType: event.transportationType,
//           transportation: event.transportation,
//           workStatus:  "new",
//           workOnsideVehicleId: event.workOnsideVehicleId,
//           ticketId: event.ticketId);
//           emit(response.fold(
//                 (l) => WorkOnSiteError(),
//                 (r) {
//               return AddWorkOnSiteSuccess( resultAddWorkOnSiteForm: r.resultAddWorkOnSiteForm);
//             }
//         )
//       );
//     });
//   }
// }


/// New Style

class WorkOnSiteBloc extends Bloc<WorkOnSiteEvent, WorkOnSiteState> {
  final ListUserRepository  listUser   = ListUserService();
  final WorkOnSiteRepo obj        = WorkOnSiteService();
  final GetListUserUserRepository user   = GetListUserUserService();
  final VehicleRepository vehicle = VehicleService();
  final TicketRepository ticket   = TicketService();
  final PlateNumberRepository plateNumber = PlateNumberService();

  WorkOnSiteBloc() : super(WorkOnSiteInitial()) {


    // on<EventGetListUser>((event, emit) async {
    //   emit(WorkOnSiteLoading());
    //   var resultListUser = await listUser.getListSuer();
    //   emit(
    //       resultListUser.fold(
    //               (l)=> WorkOnSiteError(),
    //               (r)=> WorkOnSiteGetListUserSuccess(resultListUser: r.resultListUser)
    //       )
    //   );
    // });

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

    /// call event get user approved
    on<EventGetListUsersApproved>((event, emit) async {
      emit(WorkOnSiteLoading());
      var result = await user.getListUser();
      emit(result.fold(
              (l) => WorkOnSiteError(),
              (r) => GetListUserApprovedBySuccess(r.result)
      ));
    });

    /// call event get list transportation typ
    on<EventGetListTransportationType>((event, emit) async {
      emit(GetListTransportationTypeLoading());
      var result = await vehicle.getVehicle();

      emit(result.fold(
              (l) => GetListTransportationTypeFailed(),
              (r) => GetListTransportationTypeSuccess(r)
      ));
    });

    /// call event get list ticket
    on<EventGetListTicket>((event, emit) async {
      var result = await ticket.getTicket();

      emit(result.fold(
              (l) => WorkOnSiteError(),
              (r) => GetListTicketSuccess(r)
      ));

    });


    /// call event get list plate number
    on<EventGetListPlateNumber>((event, emit) async {
      int id = event.id;
      var result = await plateNumber.getPlateNumber(id);

      emit(result.fold(
              (l) => PlateNumberFail(),
              (r){
            return GetListPlateNumberSuccess(r);
          }
      ));

    });


    /// call event validate and post data work on site
    on<EventValidateAndAddFormWorkOnSite>((event, emit) async {

      /// variable received data from event
      String purposeValue                      = event.purposeValue;
      String? approveValue                     = event.valueApprove;
      String fromDateValue                     = event.fromDateValue;
      String toDateValue                       = event.toDateValue;
      String fromTimeHour                      = event.fromTimeValue;
      String toTimeHour                        = event.toTimeValue;
      String descValue                         = event.descValue;
      String locationValue                     = event.locationValue;
      String? transportationValue              = event.valueTransportation;
      String? transportationTypeOwnerValue     = event.valueTransportationType;
      String? transportationTypeCompanyIdValue = event.vehicle;
      String? plateNumber                      = event.selectPlateNumber;
      String? ticket                           = event.ticket;
      List<ResultFile>? listResultFile         = event.listResultFile;

      /// variable for validate
      String fieldPurpose                   = AppValidation().checkField(field: purposeValue);
      String fieldDesc                      = AppValidation().checkField(field: descValue);
      String fieldLocation                  = AppValidation().checkField(field: locationValue);
      String fieldTransportation            = AppValidation().checkField(field: transportationValue);
      String fieldTransportationTypeOwner   = AppValidation().checkField(field: transportationTypeOwnerValue);
      String fieldTransportationCompanyType = AppValidation().checkField(field: transportationTypeCompanyIdValue);
      String fieldPlateNumber               = AppValidation().checkField(field: plateNumber);
      String fieldApprove                   = AppValidation().checkField(field: approveValue);
      String fieldFromTime                  = AppValidation().checkField(field: fromTimeHour);
      String fieldToTime                    = AppValidation().checkField(field: toTimeHour);
      String fieldToDate                    = AppValidation().checkFromDateAndToDate(fromDate: fromDateValue, toDate: toDateValue);
      String fieldFromDate                  = AppValidation().checkFromDateAndToDate(fromDate: fromDateValue, toDate: toDateValue);

      /// validate
      if (
      fieldPurpose.isNotEmpty ||
          fieldFromDate.isNotEmpty ||
          fieldFromTime.isNotEmpty ||
          fieldToDate.isNotEmpty ||
          fieldToTime.isNotEmpty ||
          fieldDesc.isNotEmpty ||
          fieldLocation.isNotEmpty ||
          fieldTransportation.isNotEmpty ||
          (transportationValue == "ផ្ទាល់ខ្លួន" && fieldTransportationTypeOwner.isNotEmpty) ||
          (transportationValue == "ក្រុមហ៊ុន" && fieldTransportationCompanyType.isNotEmpty) ||
          fieldApprove.isNotEmpty
      ) {
        emit(WorkOnSiteValidate(
          fieldPurpose: fieldPurpose,
          fieldFromDate: fieldFromDate,
          fieldFromTime: fieldFromTime,
          fieldToDate: fieldToDate,
          fieldToTime: fieldToTime,
          fieldDesc: fieldDesc,
          fieldLocation: fieldLocation,
          fieldTransportation: fieldTransportation,
          fieldTransportationTypeOwner: fieldTransportationTypeOwner,
          fieldPlateNumber: fieldPlateNumber,
          fieldApprove: fieldApprove,
        ));
      }
      else {
        emit(LoadingInsertWorkOnSite());
        if (transportationValue == 'ផ្ទាល់ខ្លួន') {
          var result = await obj.postData(
              approver: approveValue,
              purposeOnside: purposeValue,
              dateFrom: fromDateValue,
              timeFrom: fromTimeHour,
              dateTo: toDateValue,
              timeTo: toTimeHour,
              taskDescription: descValue,
              locationOnside: locationValue,
              transportationType: transportationTypeOwnerValue,
              transportation: transportationValue,
              workStatus: "new",
              workOnsideVehicleId: transportationTypeCompanyIdValue,
              ticketId: ticket,
              listResultFile: listResultFile
          );
          emit(result.fold(
                  (l) => FailInsertWorkOnSite(),
                  (r) => WorkOnSiteSuccess(r)
          ));

        }
        else {
          var result = await obj.postData(
              approver: approveValue,
              purposeOnside: purposeValue,
              dateFrom: fromDateValue,
              timeFrom: fromTimeHour,
              dateTo: toDateValue,
              timeTo: toTimeHour,
              taskDescription: descValue,
              locationOnside: locationValue,
              transportation: transportationValue,
              workStatus: "new",
              transportationType: transportationTypeOwnerValue,
              workOnsideVehicleId: plateNumber,
              // workOnsideVehicleId: 25,
              ticketId: ticket,
              listResultFile: listResultFile
          );
          emit(result.fold(
                  (l) => FailInsertWorkOnSite(),
                  (r) => WorkOnSiteSuccess(r)
          ));
        }
      }
    });


    /// call event get name transportation type owner
    on<EventGetNameTransportationTypeOwner>((event, emit) async {
      String nameTransportationType  = "";
      event.listTransportationTypeOwner.forEach((element) {
        if(element.id == event.id){
          nameTransportationType = element.name;
        }
      });
      emit(GetNameTransportationTypeOwnerSuccess(
        nameTransportationTypeOwner: nameTransportationType,
      ));
    });

    /// call event get id and name transportation type company
    on<EventGetIdAndNameTransportationTypeCompany>((event, emit) async {
      String nameTransportationType  = "";
      event.listTransportation.forEach((element) {
        if(element.id == event.id){
          nameTransportationType = element.vehicleTypeName;
        }
      });
      emit(GetIdAndNameTransportationTypeCompanySuccess(
          id: event.id,
          nameTranTypeCompany: nameTransportationType

      ));
    });

    /// call event hide change
    on<EventChangeIsHideAndShowPlateNumber>((event, emit) async {
      emit(IsHideAndShowPlateNumberSuccess(event.value));
    });
  }
}