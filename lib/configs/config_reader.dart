import 'dart:convert';


import 'package:flutter/services.dart';

import 'environment.dart';

abstract class ConfigReader {
  static Map<String, dynamic>? _config;
  static Environment? env;

  static Future<void> initialize(Environment environment) async {
    env = environment;
    final configString = await rootBundle.loadString(environment.value());
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String baseUrl() {
    return _config?['base_url'] as String;
  }

  static String host() {
    return _config?['host'] as String;
  }

  static String rootApi() {
    return _config?['root_api'] as String;
  }

  static String producttionUrlABA() {
    return _config?['production_url_aba'] as String;
  }

  static String createTransactionUrlABA() {
    return _config?['create_transaction_url_aba'] as String;
  }

  static String checkTransactionUrlABA() {
    return _config?['check_transaction_url_aba'] as String;
  }
}
