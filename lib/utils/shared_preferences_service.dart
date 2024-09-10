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

  Future<void> resetToken() async => await _preferences?.remove('token');

  //Set Firbase User Token
  Future<void> setFirebaseUserToken(String token) async =>
      await _preferences?.setString('firebase_user_token', token);

  String? get firebaseUserToken =>
      _preferences?.getString('firebase_user_token');

  //Set Language
  Future<void> setLanguage(String lang) async =>
      await _preferences?.setString('language', lang);

  String? get getLanguage => _preferences?.getString('language');

  //Set User Profile
  Future<void> setUserProfile(String userProfile) async =>
      await _preferences?.setString('user_profile', userProfile);

  String? get getUserProfile => _preferences?.getString('user_profile');

  //Set User Profile
  Future<void> setUserId(String userId) async =>
      await _preferences?.setString('user_id_login', userId);

  String? get getUserId => _preferences?.getString('user_id_login');

  Future<void> clear() async {
    await _preferences!.clear();
  }


  //Set User Role
  Future<void> setUserRole(String userRole) async =>
      await _preferences?.setString('user-role', userRole);

  String? get getUserRole => _preferences!.getString('user-role');

  //Set Customer Profile
  Future<void> setCustomerProfile(String customerProfile) async =>
      await _preferences!.setString('informationCustomer', customerProfile);

  String? get getCustomerProfile => _preferences?.getString('informationCustomer');





//Set User Permission
  Future<void> setUserPermission(String userPermission) async =>
      await _preferences!.setString('infoUserPermission', userPermission);

  String? get getUserPermission => _preferences?.getString('infoUserPermission');



}
