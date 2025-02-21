// To parse this JSON data, do
//
//     final plateNumberModel = plateNumberModelFromJson(jsonString);

import 'dart:convert';

PlateNumberModel plateNumberModelFromJson(String str) => PlateNumberModel.fromJson(json.decode(str));

String plateNumberModelToJson(PlateNumberModel data) => json.encode(data.toJson());

class PlateNumberModel {
  int status;
  int total;
  List<ResultPlateNumber> result;

  PlateNumberModel({
    required this.status,
    required this.total,
    required this.result,
  });

  factory PlateNumberModel.fromJson(Map<String, dynamic> json) => PlateNumberModel(
    status: json["status"],
    total: json["total"],
    result: List<ResultPlateNumber>.from(json["result"].map((x) => ResultPlateNumber.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultPlateNumber {
  int id;
  int vehicleTypeId;
  String vehicleTypeName;
  String vehiclePlateNumber;

  ResultPlateNumber({
    required this.id,
    required this.vehicleTypeId,
    required this.vehicleTypeName,
    required this.vehiclePlateNumber,
  });

  factory ResultPlateNumber.fromJson(Map<String, dynamic> json) => ResultPlateNumber(
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
