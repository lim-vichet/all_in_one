// To parse this JSON data, do
//
//     final listUserChattingModel = listUserChattingModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListUserChattingModel listUserChattingModelFromJson(String str) => ListUserChattingModel.fromJson(json.decode(str));

String listUserChattingModelToJson(ListUserChattingModel data) => json.encode(data.toJson());

class ListUserChattingModel {
  int status;
  int total;
  List<ResultListChattingModel> resultListChattingModel;

  ListUserChattingModel({
    required this.status,
    required this.total,
    required this.resultListChattingModel,
  });

  factory ListUserChattingModel.fromJson(Map<String, dynamic> json) => ListUserChattingModel(
    status: json["status"],
    total: json["total"],
    resultListChattingModel: List<ResultListChattingModel>.from(json["result"].map((x) => ResultListChattingModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(resultListChattingModel.map((x) => x.toJson())),
  };
}

class ResultListChattingModel {
  int id;
  int senderId;
  String senderNameEn;
  String senderNameKh;
  String senderImage;
  int recipientId;
  String recipientNameEn;
  String recipientNameKh;
  String recipientImage;
  String lastMessage;
  String lastUpdate;

  ResultListChattingModel({
    required this.id,
    required this.senderId,
    required this.senderNameEn,
    required this.senderNameKh,
    required this.senderImage,
    required this.recipientId,
    required this.recipientNameEn,
    required this.recipientNameKh,
    required this.recipientImage,
    required this.lastMessage,
    required this.lastUpdate,
  });

  factory ResultListChattingModel.fromJson(Map<String, dynamic> json) => ResultListChattingModel(
    id: json["id"],
    senderId: json["sender_id"],
    senderNameEn: json["sender_name_en"],
    senderNameKh: json["sender_name_kh"],
    senderImage: json["sender_image"],
    recipientId: json["recipient_id"],
    recipientNameEn: json["recipient_name_en"],
    recipientNameKh: json["recipient_name_kh"],
    recipientImage: json["recipient_image"],
    lastMessage: json["last_message"],
    lastUpdate: json["last_update"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_id": senderId,
    "sender_name_en": senderNameEn,
    "sender_name_kh": senderNameKh,
    "sender_image": senderImage,
    "recipient_id": recipientId,
    "recipient_name_en": recipientNameEn,
    "recipient_name_kh": recipientNameKh,
    "recipient_image": recipientImage,
    "last_message": lastMessage,
    "last_update": lastUpdate,
  };
}
