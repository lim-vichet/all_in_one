import 'dart:developer';
import '../../../configs/config_reader.dart';
import '../../../utils/shared_preferences_service.dart';


class BaseService {
  String get baseUrl => ConfigReader.rootApi();

  String get baseUrlHost => ConfigReader.baseUrl();

  Map<String, dynamic> authHeader() {
    Map<String, dynamic> header = {'Accept': 'application/json;'};
    String? token = SharedPreferencesService.instance?.token;
    if (token != null) header['Authorization'] = 'Bearer $token';
    log("FULL TOKEN ${token.toString()}");
    return header;
  }

  Map<String, dynamic> header() {
    return {'Accept': 'application/json;'};
  }
}
