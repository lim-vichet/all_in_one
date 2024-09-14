// To parse this JSON data, do
//
//     final listPlateNumberModel = listPlateNumberModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListPlateNumberModel listPlateNumberModelFromJson(String str) => ListPlateNumberModel.fromJson(json.decode(str));

String listPlateNumberModelToJson(ListPlateNumberModel data) => json.encode(data.toJson());

class ListPlateNumberModel {
  int status;
  int total;
  List<ResultListPlateNumber> resultListPlateNumber;

  ListPlateNumberModel({
    required this.status,
    required this.total,
    required this.resultListPlateNumber,
  });

  factory ListPlateNumberModel.fromJson(Map<String, dynamic> json) => ListPlateNumberModel(
    status: json["status"]??0,
    total: json["total"]??0,
    resultListPlateNumber: List<ResultListPlateNumber>.from(json["result"].map((x) => ResultListPlateNumber.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(resultListPlateNumber.map((x) => x.toJson())),
  };
}

class ResultListPlateNumber {
  int id;
  int vehicleTypeId;
  String vehicleTypeName;
  String vehiclePlateNumber;

  ResultListPlateNumber({
    required this.id,
    required this.vehicleTypeId,
    required this.vehicleTypeName,
    required this.vehiclePlateNumber,
  });

  factory ResultListPlateNumber.fromJson(Map<String, dynamic> json) => ResultListPlateNumber(
    id: json["id"],
    vehicleTypeId: json["vehicle_type_id"],
    vehicleTypeName: json["vehicle_type_name"],
    vehiclePlateNumber: json["vehicle_plate_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_type_id": vehicleTypeId,
    "vehicle_type_name": vehicleTypeName,
    "vehicle_plate_number": vehiclePlateNumber,
  };
}
