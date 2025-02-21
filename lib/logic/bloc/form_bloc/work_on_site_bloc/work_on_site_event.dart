part of 'work_on_site_bloc.dart';

@immutable

/// old style
abstract class WorkOnSiteEvent {}

class EventGetListUser extends WorkOnSiteEvent{}

class EventGetListVehicleType extends WorkOnSiteEvent{}

class EventGetListTicketNumber extends WorkOnSiteEvent{}

class EventGetListPlateNumberss extends WorkOnSiteEvent{
  int vehicleTypeId;

  EventGetListPlateNumberss({required this.vehicleTypeId});
}

class EventAddWorkOnSiteForm extends WorkOnSiteEvent{
  String? approver;
  String? purposeOnside;
  String? dateFrom;
  String? timeFrom;
  String? dateTo;
  String? timeTo;
  String? taskDescription;
  String? locationOnside;
  String? transportationType;
  String? transportation;
  String? workStatus;
  String? workOnsideVehicleId;
  String ticketId;
  List<ResultFile>? listResultFile;

  EventAddWorkOnSiteForm({
    required this.approver,
    required this.purposeOnside,
    required this.dateFrom,
    required this.timeFrom,
    required this.dateTo,
    required this.timeTo,
    required this.taskDescription,
    required this.locationOnside,
    required this.transportationType,
    required this.transportation,
    required this.workStatus,
    required this.ticketId,
    required this.listResultFile
});
}

/// New Style

/// event get user approved
class EventGetListUsersApproved extends WorkOnSiteEvent {}

/// event get list transportation typ
class EventGetListTransportationType extends WorkOnSiteEvent{}

/// event get list ticket
class EventGetListTicket extends WorkOnSiteEvent {}

/// event get list plate number
class EventGetListPlateNumber extends WorkOnSiteEvent{
  final int id;
  EventGetListPlateNumber(this.id);
}

/// event hide change
class EventChangeIsHideAndShowPlateNumber extends WorkOnSiteEvent{
  String value;
  EventChangeIsHideAndShowPlateNumber({required this.value});
}

/// event validate and post data work on site
class EventValidateAndAddFormWorkOnSite extends WorkOnSiteEvent {
  String purposeValue;
  String fromDateValue;
  String fromTimeValue;
  String toDateValue;
  String toTimeValue;
  String descValue;
  String locationValue;
  String? referenceValue;
  String? valueApprove;
  String? valueTransportation;
  String? valueTransportationType;
  String? ticket;
  String? vehicle;
  String? fileName;
  String? pathFile;
  String? type;
  String? name;
  String? extension;
  String? path;
  String? selectPlateNumber;
  List<ResultFile>? listResultFile;


  EventValidateAndAddFormWorkOnSite({
    required this.purposeValue,
    required this.fromDateValue,
    required this.fromTimeValue,
    required this.toDateValue,
    required this.toTimeValue,
    required this.descValue,
    required this.locationValue,
    this.referenceValue,
    required this.valueApprove,
    required this.valueTransportation,
    this.valueTransportationType,
    this.ticket,
    this.vehicle,
    this.listResultFile,
    this.selectPlateNumber,
  });

}

/// event get name transportation type owner
class EventGetNameTransportationTypeOwner extends WorkOnSiteEvent{
  int id;
  List<AppDropdown> listTransportationTypeOwner;

  EventGetNameTransportationTypeOwner({
    required this.id,
    required this.listTransportationTypeOwner,
  });

}

/// event get id and name transportation type company
class EventGetIdAndNameTransportationTypeCompany extends WorkOnSiteEvent{
  int id;
  List<ResultVehicle> listTransportation;

  EventGetIdAndNameTransportationTypeCompany({
    required this.id,
    required this.listTransportation,
  });

}

class OnValidateDate extends WorkOnSiteEvent {
  final DateTime? picked;
  final DateTime selectDate;
  final String typeDate;
  OnValidateDate(this.picked,this.selectDate,this.typeDate);
}