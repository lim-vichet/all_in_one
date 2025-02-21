// To parse this JSON data, do
//
//     final workOnSiteModel = workOnSiteModelFromJson(jsonString);

import 'dart:convert';

WorkOnSiteModel workOnSiteModelFromJson(String str) => WorkOnSiteModel.fromJson(json.decode(str));

String workOnSiteModelToJson(WorkOnSiteModel data) => json.encode(data.toJson());

class WorkOnSiteModel {
  int status;
  List<ResultWorkOnSite> result;

  WorkOnSiteModel({
    required this.status,
    required this.result,
  });

  factory WorkOnSiteModel.fromJson(Map<String, dynamic> json) => WorkOnSiteModel(
    status: json["status"]??0,
    result: List<ResultWorkOnSite>.from(json["result"].map((x) => ResultWorkOnSite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultWorkOnSite {
  int insertERequestWorkOnsideDetail;

  ResultWorkOnSite({
    required this.insertERequestWorkOnsideDetail,
  });

  factory ResultWorkOnSite.fromJson(Map<String, dynamic> json) => ResultWorkOnSite(
    insertERequestWorkOnsideDetail: json["insert_e_request_work_onside_detail"],
  );

  Map<String, dynamic> toJson() => {
    "insert_e_request_work_onside_detail": insertERequestWorkOnsideDetail,
  };
}
