import 'dart:developer';
import 'dart:io';
import 'package:all_in_one/data/services/main_services/parsed_response.dart';
import 'package:all_in_one/data/services/main_services/service_response.dart';
import 'package:dio/dio.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';

class ServiceHelper<T> {
  static const BROADCAST_SESSION_EXPIRE = 'BROADCAST_SESSION_EXPIRE';
  static const BROADCAST_ACCOUNT_DEACTIVATE = 'BROADCAST_ACCOUNT_DEACTIVATE';

  String? endpoint;
  String? baseUrl;

  ServiceHelper({
    this.baseUrl,
    this.endpoint,
  });

  FormData? _formData;
  Map<String, dynamic> _params = {};
  String _jsonData = '';
  Map<String, dynamic> _headers = {
    HttpHeaders.acceptHeader: 'application/json',
    'Charset': 'utf-8'
  };
  String _method = "GET";

  void setParams({required Map<String, dynamic> json, FormData? formData}) {
    if (json != null) {
      _params = json;
    } else if (formData != null) {
      _formData = formData;
    }
  }

  void setData({String? jsonData}) {
    if (jsonData != null) {
      _jsonData = jsonData;
    }
  }

  void setMethod(String method) => _method = method;

  void setHeader(Map<String, dynamic> headers) => _headers = headers;

  Future<ServiceResponse<T>> makeRequest() async {
    try {
      final url = baseUrl! + endpoint!;
      Response? response;

      Print.log('-------------------------------------------');
      // Print.log('URL: $_url');
      // Print.log("HEADER: $_headers");
      // Print.log('METHOD: $_method');
      final _formData = this._formData;
      if (_formData != null) {
        Print.log('FORMDATA: ${_formData.files}');
      } else {
        Print.log('PARAM: $_params');
      }

      Print.log('-------------------------------------------');

      if (_method == "GET") {
        response = await Dio().get<Map<String, dynamic>>(
          url,
          options: Options(
            headers: _headers,
          ),
          queryParameters: _params,
        );
      } else if (_method == "POST") {
        if (_jsonData == '') {
          if (_formData != null) {
            response = await Dio().post<T>(url,
                options: Options(
                  headers: _headers,
                ),
                data: _formData);
          } else {
            response = await Dio().post<T>(url,
                options: Options(
                  headers: _headers,
                ),
                data: _params);
          }
          _jsonData = '';
        } else {
          response = await Dio().post<T>(url,
              options: Options(
                headers: _headers,
              ),
              data: _jsonData);

          _jsonData = '';
        }
      } else if (_method == "PUT") {
        if (_formData != null) {
          response = await Dio().put<T>(url,
              options: Options(
                headers: _headers,
              ),
              data: _formData);
        } else {
          response = await Dio().put<T>(url,
              options: Options(
                headers: _headers,
              ),
              data: _params);
        }
      } else if (_method == "DELETE") {
        response = await Dio().delete<T>(url,
            options: Options(
              headers: _headers,
            ),
            data: _params);
      }

      Print.log('RESPONSEdfsjljsdalkjfljsdljfljdslfjl: $url ----------');
      log('longdalongdalongdalongdalongda: $response ----------');

      return ServiceResponse<T>(
        response: response?.data,
        status: ResponseStatus.RESPONSE,
        parsedResponse: ParsedResponse.fromMap(response?.data),
      );
    } on DioError catch (e) {
      Print.log('ERROR: ${e.response ?? e.message}');
      //  Case: response error
      if (e.type == DioErrorType.badResponse) {
        //  Case: token expires
        if (e.response?.statusCode == HttpStatus.unauthorized) {
          FBroadcast.instance().broadcast(BROADCAST_SESSION_EXPIRE);
          return ServiceResponse<T>(
            response: e.response?.data,
            message: 'Unauthenticated.',
            status: ResponseStatus.UNAUTHORIZED,
            parsedResponse: ParsedResponse(
              message: 'Unauthenticated',
              status: ResponseStatus.UNAUTHORIZED,
            ),
          );
        }

        //  Case: account deactivated
        if (e.response?.statusCode == HttpStatus.forbidden) {
          FBroadcast.instance().broadcast(BROADCAST_ACCOUNT_DEACTIVATE);
          return ServiceResponse<T>(
            response: e.response?.data,
            message: 'Deactivated.',
            status: ResponseStatus.UNAUTHORIZED,
            parsedResponse: ParsedResponse(
              message: 'Deactivated',
              status: ResponseStatus.UNAUTHORIZED,
            ),
          );
        }
      }
      //  Case: no Internet connection
      else if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return ServiceResponse<T>(
          response: e.response?.data,
          message: e.message,
          status: ResponseStatus.CONNECT_TIMEOUT,
          parsedResponse: ParsedResponse(
            message: 'Connection time out!!!',
            status: ResponseStatus.CONNECT_TIMEOUT,
          ),
        );
      }
      return ServiceResponse<T>(
        response: e.response?.data,
        message: e.message,
        status: ResponseStatus.ERROR,
        parsedResponse: ParsedResponse(
          message: e.message,
          status: ResponseStatus.ERROR,
        ),
      );
    } catch (e) {
      Print.log('ERROR: $e');

      return ServiceResponse<T>(
        message: e.toString(),
        status: ResponseStatus.ERROR,
        parsedResponse: ParsedResponse(
          message: e.toString(),
          status: ResponseStatus.ERROR,
        ),
      );
    }
  }
}

class Print {
  static void log(String value) {
    debugPrint(value, wrapWidth: 1024 * 5);
  }
}
