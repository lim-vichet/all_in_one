import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'main_app_validation.dart';

class AppValidation extends MainValidation {
  // String? fromDate;
  // String? toDate;
  // String? date;
  // String? dateHour;
  // String? fromTime;
  // String? toTime;
  // bool isCheck;
  // AppValidation({this.fromDate,this.toDate,this.date,this.dateHour,this.fromTime,this.toTime,this.isCheck=false});


  bool passwordStrong(String password, [int minLength = 7]) {
    if (password.isEmpty) return false;
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;
    return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters & hasMinLength;
  }

  String checkField({
    required String? field,
    bool email=false ,
    password=false ,
    bool phone=false,
    String field2="" ,
    bool limit=false }) {
    if( field.isNull ) return requiredMessage();
    field = field!.trim();
    field2 = field2.trim();
    if( field.isEmpty) return requiredMessage();
    if( limit && !phone && field.length < 4 ) return fourCharacter();
    if( email && !field.contains("@") ) return validEmail();
    if( password && !AppValidation().passwordStrong(field) ) return validatePassword();
    if( phone && field.length < 11 ) return phoneNumberMustBe9();
    if( phone && field.length >12 ) return phoneNumber10();
    if( field2.isNotEmpty && field != field2 ) return passwordNotMatch();
    return "";
  }

  String checkTimeAndCurrentTime({
    required String fromTime ,
    required String toTime ,
    required String fromDate ,
    required String toDate
  }){
    if( fromTime.isEmpty || toTime.isEmpty ) return requiredMessage();

      DateTime now = DateTime.now();
      String currentDate = DateFormat("dd-MM-yyyy").format(now);

      int currentHour = int.parse(now.hour.toString());
      int currentMin = int.parse(now.minute.toString());

      // List<String> listTime = field.split(":");
      // int pickHour = int.parse(listTime[0]); // hour
      // int pickMin = int.parse(listTime[1]); // minute

      List<String> listFromTime = fromTime.split(":");
      int newFromHour = int.parse(listFromTime[0]); // hour
      int newFromMin = int.parse(listFromTime[1]); // minute

      List<String> listToTime = toTime.split(":");
      int newToHour = int.parse(listToTime[0]); // hour
      int newToMin = int.parse(listToTime[1]); // minute

      if( fromDate.compareTo(currentDate) < 0 && toDate.compareTo(currentDate) == 0 ) { // picked current day both FROM DATE and TO DATE

        // check current time
        if( currentHour > newFromHour ) return  mustBeGreaterThanCurrentTime();
        if( currentHour == newFromHour && currentMin > newFromMin ) return  mustBeGreaterThanCurrentTime();
        // end check current time

        // check current time
        if( currentHour > newToHour ) return  mustBeGreaterThanCurrentTime();
        if( currentHour == newToHour && currentMin > newToMin ) return  mustBeGreaterThanCurrentTime();
        // end check current time

        // check from time must be smaller than to time
        if( newFromHour > newToHour ) return fromTimeSmallerThanToTime();
        if( newFromHour == newToHour && newFromMin > newToMin )  return fromTimeSmallerThanToTime();

      } else if ( fromDate.compareTo(currentDate) == 0 ) { // picked current day for FROM DATE and TO DATE greater than FROM DATE
        // print("hello to date greater than from date");
        // if( type == UrlPath().fromTime ) {
          // check current time
        // check current time
        if( currentHour > newFromHour ) return  mustBeGreaterThanCurrentTime();
        if( currentHour == newFromHour && currentMin > newFromMin ) return  mustBeGreaterThanCurrentTime();
        // end check current time

        // check current time
        if( currentHour > newToHour ) return  mustBeGreaterThanCurrentTime();
        if( currentHour == newToHour && currentMin > newToMin ) return  mustBeGreaterThanCurrentTime();
        // end check current time
          // end check current time
        // }
      } else {
        // check from time must be smaller than to time
        // check from time must be smaller than to time
        if( newFromHour > newToHour ) return fromTimeSmallerThanToTime();
        if( newFromHour == newToHour && newFromMin > newToMin )  return fromTimeSmallerThanToTime();
      }

      // if( date != null || dateHour != null ) {
      //   // check from time must be smaller than to time
      //   // print("3333333333333");
      //   if( newFromHour > newToHour ) return fromTimeSmallerThanToTime();
      //   if( newFromHour == newToHour && newFromMin > newToMin )  return fromTimeSmallerThanToTime();
      //   // for check
      //   // if( currentDate.compareTo(dateHour!) == 0 ) {
      //   //   if( currentHour > pickHour ) return  mustBeGreaterThanCurrentTime();
      //   //   if( currentHour == pickHour && currentMin > pickMin ) return  mustBeGreaterThanCurrentTime();
      //   //   if( fromTime!.compareTo(toTime!) > 0 ) return fromTimeSmallerThanToTime();
      //   // } else {
      //   //   if( fromTime!.compareTo(toTime!) > 0 ) return fromTimeSmallerThanToTime();
      //   // }
      // }

      return "";


  }

  // String checkDate({ required String field  }) {
  //     try {
  //       if( field.isEmpty ) return requiredMessage();
  //       if( fromDate == field || toDate == field || date == field || dateHour == field) return requiredMessage();
  //       if( fromDate!.compareTo(toDate!) > 0  ) return dateFromSmallThanDateTo();
  //       return "";
  //     } catch(e) {
  //       print("============================= Please initialize (fromDate,toDate) in AppValidation Constructor first =============================");
  //       return "";
  //     }
  // }

  String checkFieldDate({ required String field  }) {
    if( field.isEmpty ) return requiredMessage();
    return "";
  }

  String checkFromDateAndToDate({ required String fromDate , required String toDate  }) {

    if( fromDate.isEmpty || toDate.isEmpty ) return requiredMessage();
    List<String> listFromDate = fromDate.split("-");
    List<String> listToDate   = toDate.split("-");

    int fromDay   = int.parse(listFromDate[0]);
    int fromMonth = int.parse(listFromDate[1]);
    int fromYear  = int.parse(listFromDate[2]);

    int toDay   = int.parse(listToDate[0]);
    int toMonth = int.parse(listToDate[1]);
    int toYear  = int.parse(listToDate[2]);

    String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    // Lim vichet Validation Recovery

        // if(fromDay < int.parse(DateFormat('dd-MM-yyyy').format(DateTime.now())) ) return "Please Help Like And Share";
    // Lim vichet Validation Recovery

    print('${fromYear}');

    if( fromDay > toDay ) return dateFromSmallThanDateTo();
    if( fromYear == toYear && fromMonth > toMonth ) return dateFromSmallThanDateTo();
    if( fromYear == toYear && fromMonth == toMonth && fromDay > toDay ) return dateFromSmallThanDateTo();
    return "";
  }

  String checkFieldTime({ required String field  }) {
    if( field.isEmpty ) return requiredMessage();
    return "";
  }

  String checkFromTimeAndToTime({ required String fromTime , required String toTime }){
    if( fromTime.isEmpty || toTime.isEmpty ) return requiredMessage();
    List<String> listFromTime = fromTime.split(":");
    List<String> listToTime = toTime.split(":");

    int fromTimeHour = int.parse(listFromTime[0]);
    int fromTimeMin = int.parse(listFromTime[1]);
    int toTimeHour = int.parse(listToTime[0]);
    int toTimeMin = int.parse(listToTime[1]);

    // check from time must be smaller than to time
    if ( fromTimeHour > toTimeHour ) return fromTimeSmallerThanToTime();
    if ( fromTimeHour == toTimeHour && fromTimeMin > toTimeMin ) return fromTimeSmallerThanToTime();
    return "";
  }
}

