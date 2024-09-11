// To parse this JSON data, do
//
//     final listAttendanceModel = listAttendanceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListAttendanceModel listAttendanceModelFromJson(String str) => ListAttendanceModel.fromJson(json.decode(str));

String listAttendanceModelToJson(ListAttendanceModel data) => json.encode(data.toJson());

class ListAttendanceModel {
  int status;
  int total;
  List<ResultListAttendance> resultListAttendance;

  ListAttendanceModel({
    required this.status,
    required this.total,
    required this.resultListAttendance,
  });

  factory ListAttendanceModel.fromJson(Map<String, dynamic> json) => ListAttendanceModel(
    status: json["status"],
    total: json["total"],
    resultListAttendance: List<ResultListAttendance>.from(json["result"].map((x) => ResultListAttendance.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(resultListAttendance.map((x) => x.toJson())),
  };
}

class ResultListAttendance {
  String date;
  int id;
  String employeeId;
  String emNameEn;
  String morningCheckInStatus;
  String morningCheckInTime;
  String morningCheckOutStatus;
  String morningCheckOutTime;
  String afternoonCheckInStatus;
  String afternoonCheckInTime;
  String afternoonCheckOutStatus;
  dynamic afternoonCheckOutTime;
  bool morningLate;
  bool afternoonLate;

  ResultListAttendance({
    required this.date,
    required this.id,
    required this.employeeId,
    required this.emNameEn,
    required this.morningCheckInStatus,
    required this.morningCheckInTime,
    required this.morningCheckOutStatus,
    required this.morningCheckOutTime,
    required this.afternoonCheckInStatus,
    required this.afternoonCheckInTime,
    required this.afternoonCheckOutStatus,
    required this.afternoonCheckOutTime,
    required this.morningLate,
    required this.afternoonLate,
  });

  factory ResultListAttendance.fromJson(Map<String, dynamic> json) => ResultListAttendance(
    date: json["date"],
    id: json["id"],
    employeeId: json["employee_id"],
    emNameEn: json["em_name_en"],
    morningCheckInStatus: json["morning_check_in_status"],
    morningCheckInTime: json["morning_check_in_time"],
    morningCheckOutStatus: json["morning_check_out_status"],
    morningCheckOutTime: json["morning_check_out_time"],
    afternoonCheckInStatus: json["afternoon_check_in_status"],
    afternoonCheckInTime: json["afternoon_check_in_time"],
    afternoonCheckOutStatus: json["afternoon_check_out_status"],
    afternoonCheckOutTime: json["afternoon_check_out_time"],
    morningLate: json["morning_late"],
    afternoonLate: json["afternoon_late"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "id": id,
    "employee_id": employeeId,
    "em_name_en": emNameEn,
    "morning_check_in_status": morningCheckInStatus,
    "morning_check_in_time": morningCheckInTime,
    "morning_check_out_status": morningCheckOutStatus,
    "morning_check_out_time": morningCheckOutTime,
    "afternoon_check_in_status": afternoonCheckInStatus,
    "afternoon_check_in_time": afternoonCheckInTime,
    "afternoon_check_out_status": afternoonCheckOutStatus,
    "afternoon_check_out_time": afternoonCheckOutTime,
    "morning_late": morningLate,
    "afternoon_late": afternoonLate,
  };
}
