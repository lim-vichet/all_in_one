part of 'all_form_detail_bloc.dart';

@immutable
abstract class AllFormDetailState {}

class AllFormDetailInitial extends AllFormDetailState {}
class AllFormDetailLoading extends AllFormDetailState {}
class AllFormDetailError   extends AllFormDetailState {}
class AllFormDetailSuccess extends AllFormDetailState {}

class FormWorkOnSiteDetailSuccess extends AllFormDetailState {
  int id;
  List<ResultFormWorkOnSiteDetail> resultFormWorkOnSiteDetail;
  FormWorkOnSiteDetailSuccess({
    required this.id,
    required this.resultFormWorkOnSiteDetail
});
}
