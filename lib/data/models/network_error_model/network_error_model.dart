// To parse this JSON data, do
//
//     final networkErrorModel = networkErrorModelFromJson(jsonString);

import 'dart:convert';

NetworkErrorModel networkErrorModelFromJson(String str) =>
    NetworkErrorModel.fromJson(json.decode(str));

String networkErrorModelToJson(NetworkErrorModel data) =>
    json.encode(data.toJson());

class NetworkErrorModel {
  NetworkErrorModel({
    required this.title,
    required this.description,
    required this.statusCode,
    this.data,
  });

  String title;
  String description;
  int statusCode;
  dynamic data;

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json) =>
      NetworkErrorModel(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        statusCode: json["statusCode"] ?? "",
        data: json["data"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "statusCode": statusCode,
        "data": data,
      };
}
