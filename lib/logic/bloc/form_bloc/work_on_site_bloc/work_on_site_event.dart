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