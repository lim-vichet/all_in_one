part of 'cupertino_time_picker_cubit.dart';

@immutable
abstract class CupertinoTimePickerState {}

class CupertinoTimePickerInitial extends CupertinoTimePickerState {}

// get value for time picker dialog
class GetValueTimePickerDSuccess extends CupertinoTimePickerState{
  String value;
  GetValueTimePickerDSuccess({required this.value});
}

// get value for time picker bottom sheet
class GetValueTimePickerBSSuccess extends CupertinoTimePickerState{
  String value;
  GetValueTimePickerBSSuccess({required this.value});
}

class RemoveErrorAppPickerTBSSuccess extends CupertinoTimePickerState {
  String error;
  RemoveErrorAppPickerTBSSuccess(this.error);
}

class RemoveErrorAppPickerTDSuccess extends CupertinoTimePickerState {
  String error;
  RemoveErrorAppPickerTDSuccess(this.error);
}
