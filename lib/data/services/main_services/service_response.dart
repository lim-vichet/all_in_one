

import 'package:all_in_one/data/services/main_services/parsed_response.dart';

class ServiceResponse<T> {
  final ResponseStatus? status;
  final T? response;
  final String? message;
  final ParsedResponse? parsedResponse;
  ServiceResponse({
    this.status,
    this.response,
    this.message,
    this.parsedResponse,
  });

  ServiceResponse<T> copyWith({
    ResponseStatus? status,
    T? response,
    String? message,
    ParsedResponse? parsedResponse,
  }) {
    return ServiceResponse<T>(
      status: status ?? this.status,
      response: response ?? this.response,
      message: message ?? this.message,
      parsedResponse: parsedResponse ?? this.parsedResponse,
    );
  }
}

enum ResponseStatus {
  /// It occurs when url is opened timeout.
  CONNECT_TIMEOUT,

  // When the server response, but with a correct status, such as 200, 201...
  RESPONSE,

  /// When the server response, but with a incorrect status, such as 404, 503...
  ERROR,

  /// When the server response 401
  UNAUTHORIZED,

  /// When the request is cancelled, dio will throw a error with this type.
  CANCEL,
}
