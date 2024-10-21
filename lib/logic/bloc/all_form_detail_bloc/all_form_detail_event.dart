part of 'all_form_detail_bloc.dart';

@immutable
abstract class AllFormDetailEvent {}

class EventGetFormWorkOnSiteDetail extends AllFormDetailEvent{
  int id;
  EventGetFormWorkOnSiteDetail({
    required this.id
  });
}