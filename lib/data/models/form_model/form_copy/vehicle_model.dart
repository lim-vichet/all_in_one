// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  int status;
  int total;
  List<ResultVehicle> result;

  VehicleModel({
    required this.status,
    required this.total,
    required this.result,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
    status: json["status"],
    total: json["total"],
    result: List<ResultVehicle>.from(json["result"].map((x) => ResultVehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultVehicle {
  int id;
  String vehicleTypeName;
  bool status;
  String createdDate;
  String createdBy;

  ResultVehicle({
    required this.id,
    required this.vehicleTypeName,
    required this.status,
    required this.createdDate,
    required this.createdBy,
  });

  factory ResultVehicle.fromJson(Map<String, dynamic> json) => ResultVehicle(
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
