// To parse this JSON data, do
//
//     final formWorkOnSiteDetailModel = formWorkOnSiteDetailModelFromJson(jsonString);

import 'dart:convert';

FormWorkOnSiteDetailModel formWorkOnSiteDetailModelFromJson(String str) => FormWorkOnSiteDetailModel.fromJson(json.decode(str));

String formWorkOnSiteDetailModelToJson(FormWorkOnSiteDetailModel data) => json.encode(data.toJson());

class FormWorkOnSiteDetailModel {
  int status;
  List<ResultFormWorkOnSiteDetail> resultFormWorkOnSiteDetail;
  String btn;

  FormWorkOnSiteDetailModel({
    required this.status,
    required this.resultFormWorkOnSiteDetail,
    required this.btn,
  });

  factory FormWorkOnSiteDetailModel.fromJson(Map<String, dynamic> json) => FormWorkOnSiteDetailModel(
    status: json["status"]?? 0,
    resultFormWorkOnSiteDetail: json["result"] == null ? []: List<ResultFormWorkOnSiteDetail>.from(json["result"].map((x) => ResultFormWorkOnSiteDetail.fromJson(x))),
    btn: json["btn"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(resultFormWorkOnSiteDetail.map((x) => x.toJson())),
    "btn": btn,
  };
}

class ResultFormWorkOnSiteDetail {
  int id;
  int requestById;
  String requestByNameEn;
  String requestByNameKh;
  String idNumber;
  String gender;
  String deptNameEn;
  String deptNameKh;
  String positionEn;
  String positionKh;
  dynamic requestDate;
  String requestType;
  String tableName;
  int formTableRowId;
  List<ActionDetail> actionDetail;
  Tabledetail tabledetail;

  ResultFormWorkOnSiteDetail({
    required this.id,
    required this.requestById,
    required this.requestByNameEn,
    required this.requestByNameKh,
    required this.idNumber,
    required this.gender,
    required this.deptNameEn,
    required this.deptNameKh,
    required this.positionEn,
    required this.positionKh,
    required this.requestDate,
    required this.requestType,
    required this.tableName,
    required this.formTableRowId,
    required this.actionDetail,
    required this.tabledetail,
  });

  factory ResultFormWorkOnSiteDetail.fromJson(Map<String, dynamic> json) => ResultFormWorkOnSiteDetail(
    id: json["id"]?? 0,
    requestById: json["request_by_id"]?? 0,
    requestByNameEn: json["request_by_name_en"]?? "",
    requestByNameKh: json["request_by_name_kh"]?? "",
    idNumber: json["id_number"]?? "",
    gender: json["gender"]?? "",
    deptNameEn: json["dept_name_en"]?? "",
    deptNameKh: json["dept_name_kh"]?? "",
    positionEn: json["position_en"]?? "",
    positionKh: json["position_kh"]?? "",
    requestDate: DateTime.parse(json["request_date"]?? ""),
    requestType: json["request_type"]?? "",
    tableName: json["table_name"]?? "",
    formTableRowId: json["form_table_row_id"]?? 0,
    actionDetail: List<ActionDetail>.from(json["actionDetail"].map((x) => ActionDetail.fromJson(x))),
    tabledetail: Tabledetail.fromJson(json["tabledetail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "request_by_id": requestById,
    "request_by_name_en": requestByNameEn,
    "request_by_name_kh": requestByNameKh,
    "id_number": idNumber,
    "gender": gender,
    "dept_name_en": deptNameEn,
    "dept_name_kh": deptNameKh,
    "position_en": positionEn,
    "position_kh": positionKh,
    "request_date": requestDate.toIso8601String(),
    "request_type": requestType,
    "table_name": tableName,
    "form_table_row_id": formTableRowId,
    "actionDetail": List<dynamic>.from(actionDetail.map((x) => x.toJson())),
    "tabledetail": tabledetail.toJson(),
  };
}

class ActionDetail {
  dynamic eRequestId;
  dynamic actionById;
  dynamic actionByNameEn;
  dynamic actionByNameKh;
  dynamic statusDate;
  dynamic eRequeststatusId;
  dynamic requestType;
  String eRequestStatus;
  bool btnApprove;
  bool btnReject;
  bool btnWait;

  ActionDetail({
    required this.eRequestId,
    required this.actionById,
    required this.actionByNameEn,
    required this.actionByNameKh,
    required this.statusDate,
    required this.eRequeststatusId,
    required this.requestType,
    required this.eRequestStatus,
    required this.btnApprove,
    required this.btnReject,
    required this.btnWait,
  });

  factory ActionDetail.fromJson(Map<String, dynamic> json) => ActionDetail(
    eRequestId: json["e_request_id"]?? "",
    actionById: json["action_by_id"]?? "",
    actionByNameEn: json["action_by_name_en"]?? "",
    actionByNameKh: json["action_by_name_kh"]?? "",
    statusDate:json["status_date"] == null ? '' : DateTime.parse(json["status_date"]?? ""),
    eRequeststatusId: json["e_requeststatus_id"]?? "",
    requestType: json["request_type"]?? "",
    eRequestStatus: json["e_request_status"]?? "",
    btnApprove: json["btnApprove"]?? true,
    btnReject: json["btnReject"]?? true,
    btnWait: json["btnWait"]?? true,
  );

  Map<String, dynamic> toJson() => {
    "e_request_id": eRequestId,
    "action_by_id": actionById,
    "action_by_name_en": actionByNameEn,
    "action_by_name_kh": actionByNameKh,
    "status_date": statusDate.toIso8601String(),
    "e_requeststatus_id": eRequeststatusId,
    "request_type": requestType,
    "e_request_status": eRequestStatus,
    "btnApprove": btnApprove,
    "btnReject": btnReject,
    "btnWait": btnWait,
  };
}

class Tabledetail {
  List<Arraytable1> arraytable1;
  List<FileElement> file;

  Tabledetail({
    required this.arraytable1,
    required this.file,
  });

  factory Tabledetail.fromJson(Map<String, dynamic> json) => Tabledetail(
    arraytable1:json["arraytable1"] == null ? []: List<Arraytable1>.from(json["arraytable1"].map((x) => Arraytable1.fromJson(x))),
    file: List<FileElement>.from(json["file"].map((x) => FileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "arraytable1": List<dynamic>.from(arraytable1.map((x) => x.toJson())),
    "file": List<dynamic>.from(file.map((x) => x)),
  };
}

class Arraytable1 {
  int approverBy;
  int prepareBy;
  String idNumber;
  String onsiteNameEn;
  String onsiteNameKh;
  String onsitePosition;
  String onsitePositionKh;
  String onsiteDeptFullname;
  String onsiteDeptFullnameKh;
  String onsiteDeptShortname;
  int id;
  int eRequestWorkOnsideId;
  String purpose;
  String location;
  String transportationType;
  String transportationBy;
  String taskDescription;
  dynamic fromDate;
  dynamic toDate;
  dynamic durationPerformed;
  dynamic remark;
  dynamic createDate;
  bool status;
  dynamic maUploadedFiles;
  int workOnsideVehicleTypeDetailId;
  int ticketId;
  String workOnsideVehicleType;
  String workOnsideVehiclPlateNumber;
  dynamic ticketName;
  dynamic ticketNameKh;

  Arraytable1({
    required this.approverBy,
    required this.prepareBy,
    required this.idNumber,
    required this.onsiteNameEn,
    required this.onsiteNameKh,
    required this.onsitePosition,
    required this.onsitePositionKh,
    required this.onsiteDeptFullname,
    required this.onsiteDeptFullnameKh,
    required this.onsiteDeptShortname,
    required this.id,
    required this.eRequestWorkOnsideId,
    required this.purpose,
    required this.location,
    required this.transportationType,
    required this.transportationBy,
    required this.taskDescription,
    required this.fromDate,
    required this.toDate,
    required this.durationPerformed,
    required this.remark,
    required this.createDate,
    required this.status,
    required this.maUploadedFiles,
    required this.workOnsideVehicleTypeDetailId,
    required this.ticketId,
    required this.workOnsideVehicleType,
    required this.workOnsideVehiclPlateNumber,
    required this.ticketName,
    required this.ticketNameKh,
  });

  factory Arraytable1.fromJson(Map<String, dynamic> json) => Arraytable1(
    approverBy: json["approver_by"]?? 0,
    prepareBy: json["prepare_by"]?? 0,
    idNumber: json["id_number"]?? "",
    onsiteNameEn: json["onsite_name_en"]?? "",
    onsiteNameKh: json["onsite_name_kh"]?? "",
    onsitePosition: json["onsite_position"]?? "",
    onsitePositionKh: json["onsite_position_kh"]?? "",
    onsiteDeptFullname: json["onsite_dept_fullname"]?? "",
    onsiteDeptFullnameKh: json["onsite_dept_fullname_kh"]?? "",
    onsiteDeptShortname: json["onsite_dept_shortname"]?? "",
    id: json["id"]?? 0,
    eRequestWorkOnsideId: json["e_request_work_onside_id"]?? 0,
    purpose: json["purpose"]?? "",
    location: json["location"]?? "",
    transportationType: json["transportation_type"]?? "",
    transportationBy: json["transportation_by"]?? "",
    taskDescription: json["task_description"]?? "",
    fromDate: DateTime.parse(json["from_date"]?? ""),
    toDate: DateTime.parse(json["to_date"]?? ""),
    durationPerformed: json["duration_performed"]?? "",
    remark: json["remark"]?? "",
    createDate: DateTime.parse(json["create_date"]?? ""),
    status: json["status"]?? true,
    maUploadedFiles: json["ma_uploaded_files"]?? "",
    workOnsideVehicleTypeDetailId: json["work_onside_vehicle_type_detail_id"]?? 0,
    ticketId: json["ticket_id"]?? 0,
    workOnsideVehicleType: json["work_onside_vehicle_type"]?? "",
    workOnsideVehiclPlateNumber: json["work_onside_vehicl_plate_number"]?? "",
    ticketName: json["ticket_name"]?? "",
    ticketNameKh: json["ticket_name_kh"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "approver_by": approverBy,
    "prepare_by": prepareBy,
    "id_number": idNumber,
    "onsite_name_en": onsiteNameEn,
    "onsite_name_kh": onsiteNameKh,
    "onsite_position": onsitePosition,
    "onsite_position_kh": onsitePositionKh,
    "onsite_dept_fullname": onsiteDeptFullname,
    "onsite_dept_fullname_kh": onsiteDeptFullnameKh,
    "onsite_dept_shortname": onsiteDeptShortname,
    "id": id,
    "e_request_work_onside_id": eRequestWorkOnsideId,
    "purpose": purpose,
    "location": location,
    "transportation_type": transportationType,
    "transportation_by": transportationBy,
    "task_description": taskDescription,
    "from_date": fromDate.toIso8601String(),
    "to_date": toDate.toIso8601String(),
    "duration_performed": durationPerformed,
    "remark": remark,
    "create_date": createDate.toIso8601String(),
    "status": status,
    "ma_uploaded_files": maUploadedFiles,
    "work_onside_vehicle_type_detail_id": workOnsideVehicleTypeDetailId,
    "ticket_id": ticketId,
    "work_onside_vehicle_type": workOnsideVehicleType,
    "work_onside_vehicl_plate_number": workOnsideVehiclPlateNumber,
    "ticket_name": ticketName,
    "ticket_name_kh": ticketNameKh,
  };

}

class FileElement {
  int id;
  String filePath;
  dynamic createDate;
  int createBy;
  bool isDeleted;
  bool status;
  String fileName;
  String fileExtension;

  FileElement({
    required this.id,
    required this.filePath,
    required this.createDate,
    required this.createBy,
    required this.isDeleted,
    required this.status,
    required this.fileName,
    required this.fileExtension,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    id: json["id"]?? 0,
    filePath: json["file_path"]?? "",
    createDate: DateTime.parse(json["create_date"]?? ""),
    createBy: json["create_by"]?? 0,
    isDeleted: json["is_deleted"]?? false,
    status: json["status"]?? true,
    fileName: json["file_name"]?? "",
    fileExtension: json["file_extension"]?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file_path": filePath,
    "create_date": createDate.toIso8601String(),
    "create_by": createBy,
    "is_deleted": isDeleted,
    "status": status,
    "file_name": fileName,
    "file_extension": fileExtension,
  };
}


