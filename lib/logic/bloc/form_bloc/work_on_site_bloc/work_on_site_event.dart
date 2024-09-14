part of 'work_on_site_bloc.dart';

@immutable
abstract class WorkOnSiteEvent {}

class EventGetListUser extends WorkOnSiteEvent{}

class EventGetListVehicleType extends WorkOnSiteEvent{}

class EventGetListTicketNumber extends WorkOnSiteEvent{}

class EventGetListPlateNumber extends WorkOnSiteEvent{
  int vehicleTypeId;

  EventGetListPlateNumber({required this.vehicleTypeId});
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