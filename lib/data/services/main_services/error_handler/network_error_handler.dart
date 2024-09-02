import 'package:dio/dio.dart';
import '../../../models/network_error_model/network_error_model.dart';

class NetworkErrorHandler {
  Future<NetworkErrorModel?> exec(DioError error) async {
    String title = '';

    String description = 'Sorry This is an unexpected error';

    return NetworkErrorModel(
      title: title,
      description: description,
      statusCode: error.response!.statusCode!,
    );
  }
}
