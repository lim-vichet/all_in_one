import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_calculate_event.dart';
part 'test_calculate_state.dart';

class TestCalculateBloc extends Bloc<TestCalculateEvent, TestCalculateState> {
  TestCalculateBloc() : super(TestCalculateInitial()) {
    on<EventTestCalculate>((event, emit) {
      double taxPrice = 0.0;
      double totalPrice = 0.0;

      String taxvalue = event.taxValue;
      String unitPrice = event.unitPrice;

      taxPrice = int.parse(taxvalue) * int.parse(unitPrice) /100;
      totalPrice = double.parse(unitPrice) + taxPrice;
      emit(TestCalculateSuccess(totalPrice: totalPrice, taxPrice: taxPrice));

    });
  }
}
