// To parse this JSON data, do
//
//     final emailLoginModel = emailLoginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EmailLoginModel emailLoginModelFromJson(String str) => EmailLoginModel.fromJson(json.decode(str));

String emailLoginModelToJson(EmailLoginModel data) => json.encode(data.toJson());

class EmailLoginModel {
  String accessToken;
  String tokenType;
  int code;
  int maUserId;
  dynamic expiresAt;
  List<StaffEmailLogin> staffEmailLogin;

  EmailLoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.code,
    required this.maUserId,
    required this.expiresAt,
    required this.staffEmailLogin,
  });

  factory EmailLoginModel.fromJson(Map<String, dynamic> json) => EmailLoginModel(
    accessToken: json["access_token"]??'',
    tokenType: json["token_type"]??'',
    code: json["code"]??0,
    maUserId: json["ma_user_id"]??0,
    expiresAt: json["expires_at"]??'',
    staffEmailLogin: List<StaffEmailLogin>.from(json["staff"].map((x) => StaffEmailLogin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "code": code,
    "ma_user_id": maUserId,
    "expires_at": expiresAt.toIso8601String(),
    "staff": List<dynamic>.from(staffEmailLogin.map((x) => x.toJson())),
  };
}

class StaffEmailLogin {
  int id;
  String cid;
  String nameEn;
  String nameKh;
  String gender;
  String position;
  String positionKh;
  String department;
  String departmentKh;
  String profile;
  String email;
  String contact;
  String replace;
  DateTime dob;
  DateTime joinDate;
  String fulladdressKh;
  String fulladdressEn;

  StaffEmailLogin({
    required this.id,
    required this.cid,
    required this.nameEn,
    required this.nameKh,
    required this.gender,
    required this.position,
    required this.positionKh,
    required this.department,
    required this.departmentKh,
    required this.profile,
    required this.email,
    required this.contact,
    required this.replace,
    required this.dob,
    required this.joinDate,
    required this.fulladdressKh,
    required this.fulladdressEn,
  });

  factory StaffEmailLogin.fromJson(Map<String, dynamic> json) => StaffEmailLogin(
    id: json["id"],
    cid: json["cid"],
    nameEn: json["name_en"],
    nameKh: json["name_kh"],
    gender: json["gender"],
    position: json["position"],
    positionKh: json["position_kh"],
    department: json["department"],
    departmentKh: json["department_kh"],
    profile: json["profile"],
    email: json["email"],
    contact: json["contact"],
    replace: json["replace"],
    dob: DateTime.parse(json["dob"]),
    joinDate: DateTime.parse(json["join_date"]),
    fulladdressKh: json["fulladdress_kh"],
    fulladdressEn: json["fulladdress_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cid": cid,
    "name_en": nameEn,
    "name_kh": nameKh,
    "gender": gender,
    "position": position,
    "position_kh": positionKh,
    "department": department,
    "department_kh": departmentKh,
    "profile": profile,
    "email": email,
    "contact": contact,
    "replace": replace,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "join_date": joinDate.toIso8601String(),
    "fulladdress_kh": fulladdressKh,
    "fulladdress_en": fulladdressEn,
  };
}
