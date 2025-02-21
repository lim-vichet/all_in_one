part of 'work_on_site_bloc.dart';

@immutable
abstract class WorkOnSiteState {}


/// Old
class WorkOnSiteInitial extends WorkOnSiteState {}
class WorkOnSiteLoading extends WorkOnSiteState {}
class WorkOnSiteError   extends WorkOnSiteState {}
class WorkOnSiteGetListUserSuccess extends WorkOnSiteState {
  List<ResultListUser> resultListUser;
  WorkOnSiteGetListUserSuccess({required this.resultListUser});
}
class WorkOnSiteGetVehicleTypeSuccess extends WorkOnSiteState {
  List<ResultListVehicleType> resultListVehicleType;
  WorkOnSiteGetVehicleTypeSuccess({required this.resultListVehicleType});
}
class WorkOnSiteGetListTicketNumberSuccess extends WorkOnSiteState {
  List<ResultListTicketNumber> resultListTicketNumber;
  WorkOnSiteGetListTicketNumberSuccess({required this.resultListTicketNumber});
}
class WorkOnSiteGetListPlateNumberSuccess extends WorkOnSiteState {
  List<ResultListPlateNumber> resultListPlateNumber;
  WorkOnSiteGetListPlateNumberSuccess({required this.resultListPlateNumber});
}
class AddWorkOnSiteSuccess extends WorkOnSiteState {
  List<ResultAddWorkOnSiteForm> resultAddWorkOnSiteForm;
  AddWorkOnSiteSuccess({required this.resultAddWorkOnSiteForm});
}



/// New Style

class LoadingInsertWorkOnSite extends WorkOnSiteState {}
class FailInsertWorkOnSite extends WorkOnSiteState {}
class GetListTransportationTypeLoading extends WorkOnSiteState {}
class GetListTransportationTypeFailed extends WorkOnSiteState {}
class PlateNumberFail extends WorkOnSiteState {}

/// state get user approved success
class GetListUserApprovedBySuccess extends WorkOnSiteState {
  List<ResultUserAssign> userAssign;
  GetListUserApprovedBySuccess(this.userAssign);
}

/// state get list transportation type success
class GetListTransportationTypeSuccess extends WorkOnSiteState {
  VehicleModel data;
  GetListTransportationTypeSuccess(this.data);
}

/// state get list ticket success
class GetListTicketSuccess extends WorkOnSiteState {
  TicketModel data;
  GetListTicketSuccess(this.data);
}

/// state get list plate number success
class GetListPlateNumberSuccess extends WorkOnSiteState {
  PlateNumberModel data;
  GetListPlateNumberSuccess(this.data);
}

/// state for show and hide plate number success
class IsHideAndShowPlateNumberSuccess extends WorkOnSiteState {
  String data;
  IsHideAndShowPlateNumberSuccess(this.data);
}

/// state post data form work on site success
class WorkOnSiteSuccess extends WorkOnSiteState {
  WorkOnSiteModel data;
  WorkOnSiteSuccess(this.data);
}

/// state get name transportation  type owner
class GetNameTransportationTypeOwnerSuccess extends  WorkOnSiteState{
  String nameTransportationTypeOwner ;
  GetNameTransportationTypeOwnerSuccess({required this.nameTransportationTypeOwner});
}

/// state get id and name transportation type company
class GetIdAndNameTransportationTypeCompanySuccess extends WorkOnSiteState{
  int id;
  String nameTranTypeCompany;

  GetIdAndNameTransportationTypeCompanySuccess({
    required this.id,
    required this.nameTranTypeCompany,
  });
}

class DateValidate extends WorkOnSiteState {
  String fieldFromDate;
  String fieldToDate;
  String typeDate;
  String? date;
  DateValidate(this.fieldFromDate,this.fieldToDate,this.typeDate,this.date);
}

class DateValue extends WorkOnSiteState {
  String dateFrom;
  String dateTo;
  String typeDate;
  String? date;
  DateValue(this.dateFrom,this.dateTo,this.typeDate,this.date);
}

/// state validate form work on site
class WorkOnSiteValidate extends WorkOnSiteState {
  String fieldPurpose;
  String fieldFromDate;
  String fieldFromTime;
  String fieldToDate;
  String fieldToTime;
  String fieldDesc;
  String fieldLocation;
  String fieldTransportation;
  String fieldTransportationTypeOwner;
  // String fieldTicket;
  String fieldPlateNumber;
  String fieldApprove;

  WorkOnSiteValidate({
    required this.fieldPurpose,
    required this.fieldFromDate,
    required this.fieldFromTime,
    required this.fieldToDate,
    required this.fieldToTime,
    required this.fieldDesc,
    required this.fieldLocation,
    required this.fieldTransportation,
    required this.fieldTransportationTypeOwner,
    // required this.fieldTicket,
    required this.fieldPlateNumber,
    required this.fieldApprove,
  });

}

class ValidTime extends WorkOnSiteState {
  String fieldFromTime;
  ValidTime({required this.fieldFromTime});
}
