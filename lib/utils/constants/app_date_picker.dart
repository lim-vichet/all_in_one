
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatePickers{
  // date picker 
  datePickers(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if(picked != null ){
      return  DateFormat('dd-MM-yyyy').format(picked!);
    }
  }

}