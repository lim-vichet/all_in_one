// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) => TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  int status;
  int total;
  List<ResultTicket> result;

  TicketModel({
    required this.status,
    required this.total,
    required this.result,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    status: json["status"],
    total: json["total"],
    result: List<ResultTicket>.from(json["result"].map((x) => ResultTicket.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultTicket {
  dynamic ticketNumber;

  ResultTicket({
    required this.ticketNumber,
  });

  factory ResultTicket.fromJson(Map<String, dynamic> json) => ResultTicket(
    ticketNumber: json["ticket_number"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "ticket_number": ticketNumber,
  };
}

class TicketDropDown {
  int id;
  String name;
  TicketDropDown({ required this.id , required this.name });
}
