import 'package:shared_preferences/shared_preferences.dart';

/// Constants for SharedPreferences
class SharedPrefKeys {
  SharedPrefKeys._();
  static const String languageCode = 'languageCode';
  static const String onsignalUserId = 'onsignalUserId';
}

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesService._internal();

  static Future<void> init() async {
    _instance = SharedPreferencesService._internal();
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferencesService? get instance {
    if (_instance == null) {
      throw Exception('Please call init in main.dart');
    }
    return _instance;
  }

  //Set Chat id
  Future<void> setChatId(String token) async =>
      await _preferences?.setString('chat_id', token);

  String? get chatId => _preferences?.getString('chat_id');

  //Set Application Token
  Future<void> setToken(String token) async =>
      await _preferences?.setString('token', token);

  String? get token => _preferences?.getString('token');

  Future<void> setUserId(String token) async =>
      await _preferences?.setString('userId', token);

  String? get getUserId => _preferences?.getString('userId');

  Future<void> setUserAddress(String token) async =>
      await _preferences?.setString('userAdd', token);

  String? get getUserAddress => _preferences?.getString('userAdd');

  Future<void> resetToken() async => await _preferences?.remove('token');

  //Set Firbase User Token
  Future<void> setFirebaseUserToken(String token) async =>
      await _preferences?.setString('firebase_user_token', token);

  String? get firebaseUserToken =>
      _preferences?.getString('firebase_user_token');

  //Set Firbase User Token
  Future<void> setLanguages(String token) async =>
      await _preferences?.setString('languages', token);

  String? get getLanguages => _preferences?.getString('languages');

  //Set User Profile
  Future<void> setUserProfile(String userProfile) async =>
      await _preferences?.setString('user_profile', userProfile);

  String? get getUserProfile => _preferences?.getString('user_profile');


  //Set User Profile
  Future<void> setCartData(String data) async =>
      await _preferences?.setString('cart_data_local', data);

  String? get getCartData => _preferences?.getString('cart_data_local');

  Future<void> clear() async {
    await _preferences?.clear();
  }
}
