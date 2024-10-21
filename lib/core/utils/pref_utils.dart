//ignore: unused_import
import 'dart:convert';

import 'package:round_app/data/sevices/firebase_services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  static void clearPreferencesData() async {
    _sharedPreferences!.clear();
    await FirebaseServices.handleLogOut();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  static Future<void> setToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  static String getToken() {
    return _sharedPreferences!.getString('token') ?? '';
  }

  static Future<void> setId(int value) {
    return _sharedPreferences!.setInt('id', value);
  }

  static int getId() {
    return _sharedPreferences!.getInt('id') ?? 0;
  }

  static Future<void> setTag(List<String> lst) {
    return _sharedPreferences!.setStringList('tag', lst);
  }

  static List<String> getTag() {
    return _sharedPreferences!.getStringList('tag') ?? <String>[];
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
