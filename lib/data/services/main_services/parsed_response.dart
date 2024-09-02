

import 'package:all_in_one/data/services/main_services/service_response.dart';

class ParsedResponse<T> {
  int? code;
  ResponseStatus? status;
  String? message;
  T? data;

  ParsedResponse({
    this.status,
    this.message,
    this.data,
    this.code,
  });

  factory ParsedResponse.fromMap(Map<String, dynamic> map) {
    // if (map == null) ;
    final code = (map['code'] as int);
    return ParsedResponse(
      status: map['success'] ? ResponseStatus.RESPONSE : ResponseStatus.ERROR,
      message: map['message'],
      data: map['data'],
      code: code,
    );
  }

  ParsedResponse copyWith<Y>({
    ResponseStatus? status,
    required String? message,
    required Y? data,
  }) {
    return ParsedResponse<Y>(
      status: status!,
      message: message ?? this.message,
      data: data,
    );
  }
}
