import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants/url_path.dart';
part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit() : super(TimeInitial());
  var datePicked;
  DateTime dateTime = DateTime.now();

  void setUpTheTime(
    int hour,
    int min,
    int amOrPm,
    String typeOfTime,
  ) {
    String dateHour = DateFormat("h").format(dateTime);
    String dateMinute = DateFormat("m").format(dateTime);
    String dateAmPm = DateFormat("a").format(dateTime);
    int amPm=0;

    final now = DateTime.now();
    var currentDate = DateFormat("dd-MM-yyyy").format(now);
    var am = DateFormat("a").format(now);

    if (currentDate.toString() == datePicked.toString()) {
      int currentHour = now.hour;
      int currentMin = now.minute;

      // print("valid time-----$am");

      if (am.toString() == "AM") {
        // print("valid time-----$am");

        if (hour < currentHour) {
          // print("valid time");
          emit(ValidTimeState("valid time"));
        }
      }
    }

    String fullTime = "";
    String amOrPm0 = amOrPm == 0 ? "AM" : "PM";
    String mm = min < 10 ? "0$min" : "$min";
    typeOfTime == UrlPath().fromTime
        ? fullTime = "${hour + 1}:$mm $amOrPm0"
        : fullTime = "${hour + 1}:$mm $amOrPm0";
    emit(StateOfTheTime(hour, min, amOrPm, typeOfTime, fullTime));


  }

  void datePicker(DateTime? pick, DateTime selectDate, String typeDateString , { bool dateValid=true }) {
    DateTime? picked = pick;
    DateTime selectedDate = selectDate;
    String typeDate       = typeDateString;
    String fieldFromDate  = "" ;      String dateFrom = "" ;
    String fieldToDate    = "" ;      String dateTo   = "" ;
    String fieldDate      = "" ;      String dateValue= "" ;
    String fieldDateHour  = "" ;      String dateHour = "" ;
    final now = DateTime.now();
    var date1 = DateFormat("dd-MM-yyyy").format(now);
    var date2 = DateFormat("dd-MM-yyyy").format(picked!);
    selectedDate = picked;
    datePicked = DateFormat("dd-MM-yyyy").format(picked);
    typeDate == UrlPath().fromDate? dateFrom = datePicked: dateTo = datePicked;
    typeDate == UrlPath().fromDate ? fieldFromDate = "" : fieldToDate = "";

    if( dateValid ) {
      if( typeDate ==  UrlPath().date ) dateValue = datePicked;
      if( typeDate ==  UrlPath().dateHour ) dateHour = datePicked;
      emit(DateSuccessState(dateFrom,dateTo,typeDate,dateValue,dateHour));
    } else {
      // print("33333333333333 $selectedDate $picked");
      if (date1.compareTo(date2) < 0 || date1.compareTo(date2) == 0) {
        if( typeDate ==  UrlPath().date ) dateValue = datePicked;
        if( typeDate ==  UrlPath().dateHour ) dateHour = datePicked;
        emit(DateSuccessState(dateFrom,dateTo,typeDate,dateValue,dateHour));
      } else {
        typeDate == UrlPath().fromDate
            ? fieldFromDate = "From date must be greater than current date!"
            : fieldToDate = "From To must be greater than current date!";
        // if (typeDate == UrlPath().date) fieldDate = "Invalid";
        emit(DateErrorState(fieldFromDate, fieldToDate, typeDate, fieldDate));
      }
    }
  }



  void date(DateTime? pick){
    String valueDate = DateFormat("dd-MM-yyyy").format(pick!);
    emit(DatePickerSuccess(valueDate));
  }

  void removeErrorAppPicker(String value){
    emit(RemoveErrorAppPickerSuccess(value));
  }


}
