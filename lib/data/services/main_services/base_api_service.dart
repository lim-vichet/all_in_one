import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../configs/config_reader.dart';
import '../../../utils/shared_preferences_service.dart';

class BaseAPIService {
  String baseUrl = ConfigReader.rootApi();
  String mainUrl = ConfigReader.baseUrl();

  // GET
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    print("url --> ${baseUrl + path}");
    var response = await Dio().get(
      baseUrl + path,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Charset": "utf-8",
          "Authorization": await readTokenKey(),
        },
      ),
    );

    if (kDebugMode) {
      log("--xxxx-x---response--get---- $response");
    }
    final result = json.decode(response.toString());
    return result;
  }

  Future<dynamic> getNoToken(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    print("url --> ${baseUrl + path}");
    var response = await Dio().get(
      baseUrl + path,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Charset": "utf-8",
          "Authorization": null,
        },
      ),
    );

    if (kDebugMode) {
      log("--xxxx-x---response--get---- $response");
    }
    final result = json.decode(response.toString());
    return result;
  }

  // POST
  Future<dynamic> post(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
  }) async {
    if (kDebugMode) {
      print("url (post) : ${baseUrl + path}");
    }

    var response = await Dio().post(
      baseUrl + path,
      data: formData ?? body,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Charset": "utf-8",
          "Authorization": await readTokenKey(),
        },
      ),
    );
    log("response--- $response");

    if (kDebugMode) {}
    final result = json.decode(response.toString());
    return result;
  }

  // POST
  Future<dynamic> postLogIn(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
  }) async {
    if (kDebugMode) {
      print("url (post) : ${baseUrl + path}");
    }

    var response = await Dio().post(
      baseUrl + path,
      data: formData ?? body,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Charset": "utf-8",
          "Authorization": SharedPreferencesService.instance?.firebaseUserToken,
        },
      ),
    );
    log("response--- $response");

    if (kDebugMode) {}
    final result = json.decode(response.toString());
    return result;
  }

  // PUT or UPDATE
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    var response = await Dio().put(
      baseUrl + path,
      data: body,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Charset": "utf-8",
          "Authorization": await readTokenKey(),
        },
      ),
    );
    final result = json.decode(response.toString());
    return result;
  }

  // DELETE
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    print("url : ${baseUrl + path}");

    var response = await Dio().delete(
      baseUrl + path,
      data: body,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Charset": "utf-8",
          "Authorization": await readTokenKey(),
        },
      ),
    );
    log("response-delete-- ${response}");
    final result = json.decode(response.toString());
    return result;
  }
}

Future<String?> readTokenKey() async {
  String? token = SharedPreferencesService.instance?.token;
  print("dfjlksdfldslfj${token}");
  print("token : $token --");
  return token == null ? null : "Bearer $token";
}
