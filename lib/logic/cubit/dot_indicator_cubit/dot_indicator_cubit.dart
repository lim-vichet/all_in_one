import 'package:flutter_bloc/flutter_bloc.dart';

class DotIndicatorCubit extends Cubit<int>{
  DotIndicatorCubit(super.initialState);


  int currentIndex = 0;

  void onIndicatorChange(int index) {
    currentIndex = index;
    emit(currentIndex);
  }
}