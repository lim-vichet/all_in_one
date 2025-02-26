part of 'test_calculate_bloc.dart';

@immutable
abstract class TestCalculateState {}

class TestCalculateInitial extends TestCalculateState {}
class TestCalculateLoading extends TestCalculateState {}
class TestCalculateError   extends TestCalculateState {}
class TestCalculateSuccess extends TestCalculateState {
  double totalPrice;
  double taxPrice;
  TestCalculateSuccess({required this.totalPrice, required this.taxPrice});
}