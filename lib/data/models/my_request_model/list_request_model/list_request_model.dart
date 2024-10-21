// To parse this JSON data, do
//
//     final listMyRequestModel = listMyRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListMyRequestModel listMyRequestModelFromJson(String str) => ListMyRequestModel.fromJson(json.decode(str));

String listMyRequestModelToJson(ListMyRequestModel data) => json.encode(data.toJson());

class ListMyRequestModel {
  int status;
  int total;
  List<ResultListRequest> resultListRequest;

  ListMyRequestModel({
    required this.status,
    required this.total,
    required this.resultListRequest,
  });

  factory ListMyRequestModel.fromJson(Map<String, dynamic> json) => ListMyRequestModel(
    status: json["status"],
    total: json["total"]??0,
    resultListRequest: List<ResultListRequest>.from(json["result"].map((x) => ResultListRequest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(resultListRequest.map((x) => x.toJson())),
  };
}

class ResultListRequest {
  int id;
  String formName;
  DateTime createDate;
  String fileName;
  int eRequestFormId;
  dynamic requestBy;
  dynamic eRequestStatus;
  dynamic comment;
  dynamic actionBy;
  int formTableRowId;
  String formNameEn;
  String formTableName;
  bool eRequestTableStatus;
  bool eRequestTableDelete;
  dynamic erdid;
  dynamic purpose;
  dynamic notificationId;

  ResultListRequest({
    required this.id,
    required this.formName,
    required this.createDate,
    required this.fileName,
    required this.eRequestFormId,
    required this.requestBy,
    required this.eRequestStatus,
    required this.comment,
    required this.actionBy,
    required this.formTableRowId,
    required this.formNameEn,
    required this.formTableName,
    required this.eRequestTableStatus,
    required this.eRequestTableDelete,
    required this.erdid,
    required this.purpose,
    required this.notificationId,
  });

  factory ResultListRequest.fromJson(Map<String, dynamic> json) => ResultListRequest(
    id: json["id"]??0,
    formName: json["form_name"]??0,
    createDate: DateTime.parse(json["create_date"]),
    fileName: json["file_name"]??0,
    eRequestFormId: json["e_request_form_id"]??0,
    requestBy: json["request_by"]??0,
    eRequestStatus: json["e_request_status"],
    comment: json["comment"],
    actionBy: json["action_by"],
    formTableRowId: json["form_table_row_id"],
    formNameEn: json["form_name_en"],
    formTableName: json["form_table_name"],
    eRequestTableStatus: json["e_request_table_status"],
    eRequestTableDelete: json["e_request_table_delete"],
    erdid: json["erdid"],
    purpose: json["purpose"],
    notificationId: json["notification_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "form_name": formName,
    "create_date": createDate.toIso8601String(),
    "file_name": fileName,
    "e_request_form_id": eRequestFormId,
    "request_by": requestByValues.reverse[requestBy],
    "e_request_status": eRequestStatus,
    "comment": comment,
    "action_by": actionBy,
    "form_table_row_id": formTableRowId,
    "form_name_en": formNameEn,
    "form_table_name": formTableName,
    "e_request_table_status": eRequestTableStatus,
    "e_request_table_delete": eRequestTableDelete,
    "erdid": erdid,
    "purpose": purpose,
    "notification_id": notificationId,
  };
}

enum RequestBy {
  VICHET_LIM
}

final requestByValues = EnumValues({
  "Vichet Lim": RequestBy.VICHET_LIM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
