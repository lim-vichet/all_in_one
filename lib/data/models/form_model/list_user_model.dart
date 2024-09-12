// To parse this JSON data, do
//
//     final listUserModel = listUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListUserModel listUserModelFromJson(String str) => ListUserModel.fromJson(json.decode(str));

String listUserModelToJson(ListUserModel data) => json.encode(data.toJson());

class ListUserModel {
  int status;
  List<ResultListUser> resultListUser;

  ListUserModel({
    required this.status,
    required this.resultListUser,
  });

  factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
    status: json["status"]??0,
    resultListUser: List<ResultListUser>.from(json["result"].map((x) => ResultListUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(resultListUser.map((x) => x.toJson())),
  };
}

class ResultListUser {
  int id;
  String name;

  ResultListUser({
    required this.id,
    required this.name,
  });

  factory ResultListUser.fromJson(Map<String, dynamic> json) => ResultListUser(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
