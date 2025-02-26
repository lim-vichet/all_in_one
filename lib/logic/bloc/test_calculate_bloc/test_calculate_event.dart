part of 'test_calculate_bloc.dart';

@immutable
abstract class TestCalculateEvent {}

class EventTestCalculate extends TestCalculateEvent{
  String taxValue;
  String unitPrice;
  EventTestCalculate({required this.unitPrice, required this.taxValue});
}