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
