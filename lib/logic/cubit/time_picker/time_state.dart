part of 'time_cubit.dart';

@immutable
abstract class TimeState {}

class TimeInitial extends TimeState {}
class TimePicker extends TimeState {
  int time;
  String timType;
  TimePicker(this.time,this.timType);
}

class TimeMin extends TimeState {
  int min;
  String timType;
  TimeMin(this.min,this.timType);
}

class ChangeType extends TimeState {
  int type;
  String timType;
  ChangeType(this.type,this.timType);
}

class SetTime extends TimeState {
  String defaultTime;
  SetTime(this.defaultTime);
}

class SetTimeTo extends TimeState {
  String defaultTime;
  SetTimeTo(this.defaultTime);
}





//================ new =====================
class HourState extends TimeState {
  final int hour;
  final int min;
  final int typeShift;
  final String typeOfTime;
  HourState(this.hour,this.min,this.typeShift,this.typeOfTime);
}
class MinuteState extends TimeState {
  final int hour;
  final int min;
  final int typeShift;
  final String typeOfTime;
  MinuteState(this.min,this.hour,this.typeShift,this.typeOfTime);
}
class TypeShiftState extends TimeState {
  final int hour;
  final int min;
  final int typeShift;
  final String typeOfTime;
  TypeShiftState(this.typeShift,this.hour,this.min,this.typeOfTime);
}

class StateOfTheTime extends TimeState {
  final int hour;
  final int min;
  final int amOrPm;
  final String typeOfTime;
  final String fullTime;
  StateOfTheTime(this.hour,this.min,this.amOrPm,this.typeOfTime,this.fullTime);
}
class SetCurrentTimeState extends TimeState {
  String currentTime;
  SetCurrentTimeState(this.currentTime);
}

class DateSuccessState extends TimeState {
  String dateFrom;
  String dateTo;
  String typeDate;
  String? date;
  String? dateHour;
  DateSuccessState(this.dateFrom,this.dateTo,this.typeDate,this.date,this.dateHour);
}

class DateErrorState extends TimeState {
  String fieldFromDate;
  String fieldToDate;
  String typeDate;
  String? date;
  DateErrorState(this.fieldFromDate,this.fieldToDate,this.typeDate,this.date);
}

class ValidTimeState extends TimeState {
  String validTime;
  ValidTimeState(this.validTime);
}

class DatePickerSuccess extends TimeState {
  String valueDate;
  DatePickerSuccess(this.valueDate);
}


class RemoveErrorAppPickerSuccess extends TimeState {
  String error;
  RemoveErrorAppPickerSuccess(this.error);
}
