// To parse this JSON data, do
//
//     final listTicketNumberModel = listTicketNumberModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListTicketNumberModel listTicketNumberModelFromJson(String str) => ListTicketNumberModel.fromJson(json.decode(str));

String listTicketNumberModelToJson(ListTicketNumberModel data) => json.encode(data.toJson());

class ListTicketNumberModel {
  int status;
  int total;
  List<ResultListTicketNumber> resultListTicketNumber;

  ListTicketNumberModel({
    required this.status,
    required this.total,
    required this.resultListTicketNumber,
  });

  factory ListTicketNumberModel.fromJson(Map<String, dynamic> json) => ListTicketNumberModel(
    status: json["status"],
    total: json["total"],
    resultListTicketNumber: List<ResultListTicketNumber>.from(json["result"].map((x) => ResultListTicketNumber.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(resultListTicketNumber.map((x) => x.toJson())),
  };
}

class ResultListTicketNumber {
  int id;
  String ticketNumber;

  ResultListTicketNumber({
    required this.id,
    required this.ticketNumber,
  });

  factory ResultListTicketNumber.fromJson(Map<String, dynamic> json) => ResultListTicketNumber(
    id: json["id"],
    ticketNumber: json["ticket_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ticket_number": ticketNumber,
  };
}
