import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../utils/global_use.dart';

part 'select_language_state.dart';

class SelectLanguageCubit extends Cubit<bool> {
  SelectLanguageCubit(bool initialState) : super(initialState);
  bool correctBtn = lan=="kh"?false:true;

  void SelectLanguage (bool val){
    correctBtn = val;
    emit(correctBtn);
  }
}
