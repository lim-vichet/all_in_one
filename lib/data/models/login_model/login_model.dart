// To parse this JSON data, do
//
//     final userInformationModel = userInformationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserInformationModel userInformationModelFromJson(String str) => UserInformationModel.fromJson(json.decode(str));

String userInformationModelToJson(UserInformationModel data) => json.encode(data.toJson());

class UserInformationModel {
  int status;
  int success;
  String message;
  int userId;
  String profile;
  String birthDate;
  String shopId;
  dynamic username;
  String education;
  String educationName;
  String occupation;
  String occupationName;
  String email;
  String image;
  String logo;
  String phone;
  String lat;
  String lng;
  String userRole;
  int userRoleId;
  String postion;
  String gender;
  int address;
  String accessToken;
  String tokenType;
  String expiresAt;

  UserInformationModel({
    required this.status,
    required this.success,
    required this.message,
    required this.userId,
    required this.profile,
    required this.birthDate,
    required this.shopId,
    required this.username,
    required this.education,
    required this.educationName,
    required this.occupation,
    required this.occupationName,
    required this.email,
    required this.image,
    required this.logo,
    required this.phone,
    required this.lat,
    required this.lng,
    required this.userRole,
    required this.userRoleId,
    required this.postion,
    required this.gender,
    required this.address,
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
  });

  factory UserInformationModel.fromJson(Map<String, dynamic> json) => UserInformationModel(
    status: json["status"]??0,
    success: json["success"]??0,
    message: json["message"]??"",
    userId: json["user_id"]??0,
    profile: json["profile"]??"",
    birthDate: json["birth_date"]??"",
    shopId: json["shop_id"].toString(),
    username: json["username"]??"",
    education: json["education"]??"",
    occupation: json["occupation"]??"",
    email: json["email"]??"",
    image: json["image"]??"",
    logo: json["logo"]??"",
    phone: json["phone"]??"",
    lat: json["lat"].toString(),
    lng: json["lng"].toString(),
    userRole: json["user_role"]??"",
    userRoleId: json["user_roleId"]??0,
    postion: json["postion"]??"",
    gender: json["gender"]??"",
    address: json["address"]??0,
    accessToken: json["access_token"]??"",
    tokenType: json["token_type"]??"",
    expiresAt: json["expires_at"]??"",
    educationName: json["educationName"]??'',
    occupationName: json["occupationName"]??'',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "user_id": userId,
    "profile": profile,
    "birth_date": birthDate,
    "shop_id": shopId,
    "username": username,
    "education": education,
    "educationName": educationName,
    "occupation": occupation,
    "occupationName": occupationName,
    "email": email,
    "image": image,
    "logo": logo,
    "phone": phone,
    "lat": lat,
    "lng": lng,
    "user_role": userRole,
    "user_roleId": userRoleId,
    "postion": postion,
    "gender": gender,
    "address": address,
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_at": expiresAt,
  };
}
