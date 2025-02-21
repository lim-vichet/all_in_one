// To parse this JSON data, do
//
//     final userNameModel = userNameModelFromJson(jsonString);

import 'dart:convert';

UserNameModel userNameModelFromJson(String str) => UserNameModel.fromJson(json.decode(str));

String userNameModelToJson(UserNameModel data) => json.encode(data.toJson());

class UserNameModel {
  int status;
  List<ResultUserName> result;
  UserNameModel({
    required this.status,
    required this.result,
  });
  factory UserNameModel.fromJson(Map<String, dynamic> json) => UserNameModel(
    status: json["status"]??0,
    result: List<ResultUserName>.from(json["result"].map((x) => ResultUserName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultUserName {
  int id;
  String name;
  ResultUserName({
    required this.id,
    required this.name,
  });
  factory ResultUserName.fromJson(Map<String, dynamic> json) => ResultUserName(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Transportation {
  String id;
  String name;
  Transportation({required this.id , required this.name});
}

class TransportationType {
  String id;
  String name;
  TransportationType({required this.id , required this.name});
}



