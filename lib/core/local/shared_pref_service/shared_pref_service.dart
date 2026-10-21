import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class SharedPrefService {
  final SharedPreferences _prefs;
  SharedPrefService(this._prefs);

  Future<void> setString({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  String? getString({required String key}) {
    return _prefs.getString(key);
  }

  Future<void> setInt({required String key, required int value}) async {
    await _prefs.setInt(key, value);
  }

  int? getInt({required String key}) {
    return _prefs.getInt(key);
  }

  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  Future<void> setBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }

  Future<void> setMap({required String key, required Map<String, dynamic> value}) async {
    await _prefs.setString(key, jsonEncode(value));
  }

  Map<String, dynamic>? getMap({required String key}) {
    return _prefs.getString(key) != null ? jsonDecode(_prefs.getString(key)!) : null;
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }

  List<String> getAllKeys() {
    return _prefs.getKeys().toList();
  }
}
