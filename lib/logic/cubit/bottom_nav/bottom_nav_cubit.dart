import 'package:bloc/bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit(int initialState) : super(initialState);

  int currentIndex = 0;

  void onNavbarIndexChange(int index) {
    currentIndex = index;
    emit(currentIndex);
  }
}
