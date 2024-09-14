part of 'work_on_site_bloc.dart';

@immutable
abstract class WorkOnSiteState {}

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