// To parse this JSON data, do
//
//     final listVehicleTypeModel = listVehicleTypeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListVehicleTypeModel listVehicleTypeModelFromJson(String str) => ListVehicleTypeModel.fromJson(json.decode(str));

String listVehicleTypeModelToJson(ListVehicleTypeModel data) => json.encode(data.toJson());

class ListVehicleTypeModel {
  int status;
  int total;
  List<ResultListVehicleType> resultListVehicleType;

  ListVehicleTypeModel({
    required this.status,
    required this.total,
    required this.resultListVehicleType,
  });

  factory ListVehicleTypeModel.fromJson(Map<String, dynamic> json) => ListVehicleTypeModel(
    status: json["status"]??0,
    total: json["total"]??0,
    resultListVehicleType: List<ResultListVehicleType>.from(json["result"].map((x) => ResultListVehicleType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(resultListVehicleType.map((x) => x.toJson())),
  };
}

class ResultListVehicleType {
  int id;
  String vehicleTypeName;
  bool status;
  String createdDate;
  String createdBy;

  ResultListVehicleType({
    required this.id,
    required this.vehicleTypeName,
    required this.status,
    required this.createdDate,
    required this.createdBy,
  });

  factory ResultListVehicleType.fromJson(Map<String, dynamic> json) => ResultListVehicleType(
    id: json["id"],
    vehicleTypeName: json["vehicle_type_name"],
    status: json["status"],
    createdDate: json["created_date"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_type_name": vehicleTypeName,
    "status": status,
    "created_date": createdDate,
    "created_by": createdBy,
  };
}
