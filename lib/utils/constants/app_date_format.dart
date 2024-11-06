import 'package:intl/intl.dart';

class AppDateFormat{
  /// function convert dd-mm-yyy
   convertToDDMMYYYY({required String originalDate}){
    /// Parse the original date string into a DateTime object
    DateTime parsedDate = DateTime.parse(originalDate);

    /// Format the DateTime object into the desired format (dd-MM-yyyy)
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);

    return formattedDate;
  }

   /// function convert date to d-MM-yyyy HH:mm a
   convertToDDMMMYYYYHHMM({required String originalDate}){
     /// Parse the original date string into a DateTime object
     DateTime parsedDate = DateTime.parse(originalDate);

     /// Format the DateTime object into the desired format (dd-MM-yyyy HH:mm a)
     String formattedDate = DateFormat('dd-MM-yyyy HH:mm a').format(parsedDate);

     return formattedDate;
   }

  /// function convert date to E.d MMM yyyy HH:mm a
   convertToEDMMMYYYYHHMM({required String originalDate}){
    /// Parse the original date string into a DateTime object
    DateTime parsedDate = DateTime.parse(originalDate);

    /// Format the DateTime object into the desired format (E.d MMM yyyy HH:mm a)
    String formattedDate = DateFormat('E.d MMM yyyy HH:mm a').format(parsedDate);

    return formattedDate;
  }


   /// function convert date to h:MM TT
   convertToHMMSS({required String originalDate}){
     /// Parse the original date string into a DateTime object
     DateTime parsedDate = DateTime.parse(originalDate);

     /// Format the DateTime object into the desired format (h:MM:ss TT)
     String formattedDate = DateFormat('h:MM:ss a').format(parsedDate);

     return formattedDate;
   }



}