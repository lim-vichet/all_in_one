// To parse this JSON data, do
//
//     final getListUserApprovedModel = getListUserApprovedModelFromJson(jsonString);

import 'dart:convert';

GetListUserApprovedModel getListUserApprovedModelFromJson(String str) => GetListUserApprovedModel.fromJson(json.decode(str));

String getListUserApprovedModelToJson(GetListUserApprovedModel data) => json.encode(data.toJson());

class GetListUserApprovedModel {
  final int status;
  final int total;
  final List<ResultUserAssign> result;

  GetListUserApprovedModel({
    required this.status,
    required this.total,
    required this.result,
  });

  factory GetListUserApprovedModel.fromJson(Map<String, dynamic> json) => GetListUserApprovedModel(
    status: json["status"]?? 0,
    total: json["total"]?? 0,
    result: List<ResultUserAssign>.from(json["result"].map((x) => ResultUserAssign.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultUserAssign {
  final int id;
  final int maUserId;
  final String idNumber;
  final String firstNameEn;
  final String lastNameEn;
  final String sex;
  final String joinDate;
  final String image;
  final String email;
  final String contact;
  final String position;
  final String positionKh;
  final String contractName;
  final String contractNameKh;
  final String nation;
  final String nssfId;
  final String maIdentificationNumber;
  final bool userActive;

  ResultUserAssign({
    required this.id,
    required this.maUserId,
    required this.idNumber,
    required this.firstNameEn,
    required this.lastNameEn,
    required this.sex,
    required this.joinDate,
    required this.image,
    required this.email,
    required this.contact,
    required this.position,
    required this.positionKh,
    required this.contractName,
    required this.contractNameKh,
    required this.nation,
    required this.nssfId,
    required this.maIdentificationNumber,
    required this.userActive,
  });

  factory ResultUserAssign.fromJson(Map<String, dynamic> json) => ResultUserAssign(
    id: json["id"]??0,
    maUserId: json["ma_user_id"]??0,
    idNumber: json["id_number"]??'',
    firstNameEn: json["first_name_en"]??'',
    lastNameEn: json["last_name_en"]??'',
    sex: json["sex"]??'',
    joinDate: json["join_date"]?? "",
    image: json["image"]??'',
    email: json["email"]??'',
    contact: json["contact"]??'',
    position: json["position"]??'',
    positionKh: json["position_kh"]??'',
    contractName: json["contract_name"]??'',
    contractNameKh: json["contract_name_kh"]??'',
    nation: json["nation"]??'',
    nssfId: json["nssf_id"]??'',
    maIdentificationNumber: json["ma_identification_number"]??'',
    userActive: json["user_active"]?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ma_user_id": maUserId,
    "id_number": idNumber,
    "first_name_en": firstNameEn,
    "last_name_en": lastNameEn,
    "sex":sex,
    "join_date": joinDate,
    "image": image,
    "email": email,
    "contact": contact,
    "position": position,
    "position_kh": positionKh,
    "contract_name": contractName,
    "contract_name_kh": contractNameKh,
    "nation": nation,
    "nssf_id": nssfId,
    "ma_identification_number": maIdentificationNumber,
    "user_active": userActive,
  };
}
