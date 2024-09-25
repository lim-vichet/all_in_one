// To parse this JSON data, do
//
//     final uploadModel = uploadModelFromJson(jsonString);

import 'dart:convert';

UploadModel uploadModelFromJson(String str) => UploadModel.fromJson(json.decode(str));

String uploadModelToJson(UploadModel data) => json.encode(data.toJson());

class UploadModel {
  int status;
  List<ResultFile> result;

  UploadModel({
    required this.status,
    required this.result,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
    status: json["status"] ?? 0,
    result: List<ResultFile>.from(json["result"].map((x) => ResultFile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };


  static listMapFile(listResultFile) {
    Map mapFile = {};

    // for( int i = 0 ; i < listResultFile.length ; i++ ) {
    //   mapFile["$i"] = {
    //     "fileName":listResultFile[i].fileName,
    //     "pathFile":listResultFile[i].pathFile,
    //     "type" :listResultFile[i].type,
    //     "name" :listResultFile[i].name,
    //     "extension":listResultFile[i].extension,
    //     "path":listResultFile[i].path
    //   };
    // }
    return mapFile;
  }


  static listMapIdStaff(listResultFile) {
    Map mapFile = {};
    Map data = {};
    for( int i = 0 ; i < listResultFile.length ; i++ ) {
      data = {
        "$i":"${listResultFile[i].id}",
      };
      mapFile.addAll(data);
    }
    // return json.encoder.convert(mapFile);
    return mapFile;
  }


  static listMapId(listResult) {
    Map mapFile = {};
    Map data = {};
    for( int i = 0 ; i < listResult.length ; i++ ) {
      data = {
        "$i":"${listResult[i]}",
      };
      mapFile.addAll(data);
    }
    // return json.encoder.convert(mapFile);
    return mapFile;
  }

  static listMapData(listResultFile) {
    Map mapFile = {};
    Map data = {};
    for( int i = 0 ; i < listResultFile.length ; i++ ) {
      data = {
        "$i":"${listResultFile[i].idTicketDetails}",
      };
      mapFile.addAll(data);
    }
    // return json.encoder.convert(mapFile);
    return mapFile;
  }
}

class ResultFile {
  String fileName;
  String pathFile;
  String type;
  String name;
  String extension;
  String path;

  ResultFile({
    required this.fileName,
    required this.pathFile,
    required this.type,
    required this.name,
    required this.extension,
    required this.path,
  });

  factory ResultFile.fromJson(Map<String, dynamic> json) => ResultFile(
    fileName: json["fileName"],
    pathFile: json["pathFile"],
    type: json["type"],
    name: json["name"],
    extension: json["extension"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "fileName": fileName,
    "pathFile": pathFile,
    "type": type,
    "name": name,
    "extension": extension,
    "path": path,
  };
}
