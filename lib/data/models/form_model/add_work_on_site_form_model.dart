// To parse this JSON data, do
//
//     final addWorkOnSiteFormModel = addWorkOnSiteFormModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddWorkOnSiteFormModel addWorkOnSiteFormModelFromJson(String str) => AddWorkOnSiteFormModel.fromJson(json.decode(str));

String addWorkOnSiteFormModelToJson(AddWorkOnSiteFormModel data) => json.encode(data.toJson());

class AddWorkOnSiteFormModel {
  int status;
  List<ResultAddWorkOnSiteForm> resultAddWorkOnSiteForm;

  AddWorkOnSiteFormModel({
    required this.status,
    required this.resultAddWorkOnSiteForm,
  });

  factory AddWorkOnSiteFormModel.fromJson(Map<String, dynamic> json) => AddWorkOnSiteFormModel(
    status: json["status"],
    resultAddWorkOnSiteForm: List<ResultAddWorkOnSiteForm>.from(json["result"].map((x) => ResultAddWorkOnSiteForm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(resultAddWorkOnSiteForm.map((x) => x.toJson())),
  };
}

class ResultAddWorkOnSiteForm {
  int insertERequestWorkOnsideDetail;

  ResultAddWorkOnSiteForm({
    required this.insertERequestWorkOnsideDetail,
  });

  factory ResultAddWorkOnSiteForm.fromJson(Map<String, dynamic> json) => ResultAddWorkOnSiteForm(
    insertERequestWorkOnsideDetail: json["insert_e_request_work_onside_detail"],
  );

  Map<String, dynamic> toJson() => {
    "insert_e_request_work_onside_detail": insertERequestWorkOnsideDetail,
  };
}
