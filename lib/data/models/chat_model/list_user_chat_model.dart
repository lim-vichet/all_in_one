// To parse this JSON data, do
//
//     final listUserChatModel = listUserChatModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListUserChatModel listUserChatModelFromJson(String str) => ListUserChatModel.fromJson(json.decode(str));

String listUserChatModelToJson(ListUserChatModel data) => json.encode(data.toJson());

class ListUserChatModel {
  int status;
  int total;
  List<ResultListUserChat> resultListUserChat;

  ListUserChatModel({
    required this.status,
    required this.total,
    required this.resultListUserChat,
  });

  factory ListUserChatModel.fromJson(Map<String, dynamic> json) => ListUserChatModel(
    status: json["status"],
    total: json["total"],
    resultListUserChat: List<ResultListUserChat>.from(json["result"].map((x) => ResultListUserChat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(resultListUserChat.map((x) => x.toJson())),
  };
}

class ResultListUserChat {
  int id;
  int maUserId;
  String idNumber;
  String firstNameEn;
  String lastNameEn;
  Sex sex;
  DateTime joinDate;
  String image;
  String email;
  String contact;
  String position;
  String positionKh;
  ContractName contractName;
  ContractNameKh contractNameKh;
  Nation nation;
  String nssfId;
  String maIdentificationNumber;
  bool userActive;

  ResultListUserChat({
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

  factory ResultListUserChat.fromJson(Map<String, dynamic> json) => ResultListUserChat(
    id: json["id"],
    maUserId: json["ma_user_id"],
    idNumber: json["id_number"],
    firstNameEn: json["first_name_en"],
    lastNameEn: json["last_name_en"],
    sex: sexValues.map[json["sex"]]!,
    joinDate: DateTime.parse(json["join_date"]),
    image: json["image"],
    email: json["email"],
    contact: json["contact"],
    position: json["position"],
    positionKh: json["position_kh"],
    contractName: contractNameValues.map[json["contract_name"]]!,
    contractNameKh: contractNameKhValues.map[json["contract_name_kh"]]!,
    nation: nationValues.map[json["nation"]]!,
    nssfId: json["nssf_id"],
    maIdentificationNumber: json["ma_identification_number"],
    userActive: json["user_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ma_user_id": maUserId,
    "id_number": idNumber,
    "first_name_en": firstNameEn,
    "last_name_en": lastNameEn,
    "sex": sexValues.reverse[sex],
    "join_date": joinDate.toIso8601String(),
    "image": image,
    "email": email,
    "contact": contact,
    "position": position,
    "position_kh": positionKh,
    "contract_name": contractNameValues.reverse[contractName],
    "contract_name_kh": contractNameKhValues.reverse[contractNameKh],
    "nation": nationValues.reverse[nation],
    "nssf_id": nssfId,
    "ma_identification_number": maIdentificationNumber,
    "user_active": userActive,
  };
}

enum ContractName {
  FIXED_DURATION_CONTRACT,
  PERMANENT,
  PROBATION
}

final contractNameValues = EnumValues({
  "Fixed Duration Contract": ContractName.FIXED_DURATION_CONTRACT,
  "Permanent": ContractName.PERMANENT,
  "Probation": ContractName.PROBATION
});

enum ContractNameKh {
  CONTRACT_NAME_KH,
  EMPTY,
  PURPLE
}

final contractNameKhValues = EnumValues({
  "កិច្ចសន្យាមានការកំណត់១ឆ្នាំ": ContractNameKh.CONTRACT_NAME_KH,
  "កិច្ចសន្យាការងារសាកល្បង": ContractNameKh.EMPTY,
  "កិច្ចសន្យាការងារអចិន្ត្រៃយ៍": ContractNameKh.PURPLE
});

enum Nation {
  CAMBODIA,
  EMPTY,
  KHMER,
  NATION_KHMER
}

final nationValues = EnumValues({
  "Cambodia": Nation.CAMBODIA,
  "ខ្មែរ": Nation.EMPTY,
  "khmer": Nation.KHMER,
  "Khmer": Nation.NATION_KHMER
});

enum Sex {
  FEMALE,
  MALE
}

final sexValues = EnumValues({
  "female": Sex.FEMALE,
  "male": Sex.MALE
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
