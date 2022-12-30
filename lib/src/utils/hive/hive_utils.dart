import 'dart:async' show Future;
import 'dart:convert';

import 'package:admin_dash/src/utils/hive/hive_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Local Storage Utils
class HiveUtils {
  static Future<Box> get _instance async =>
      _box = await Hive.openBox(HiveKeys.boxName);

  static late Box _box;

  /// To initialize hive
  static Future<Box> init() async {
    // final Directory _directory = await getApplicationDocumentsDirectory();
    // Hive.init(_directory.path);
    await Hive.initFlutter();
    _box = await _instance;
    return _box;
  }

  /// Set data in storage
  static void set(String key, dynamic value) {
    final String data = toJsonEncode(value);
    _box.put(key, data);
  }

  /// Get data from storage
  static dynamic get(String key) {
    final String data = _box.get(key);
    final dynamic decodedData = toJsonDecode(data);
    return decodedData;
  }

  /// Remove data from storage
  static void remove(String key) {
    _box.delete(key);
  }

  /// Set data in storage
  static bool isContainKey(String key) {
    return _box.containsKey(key);
  }

  /// clear data in storage
  static Future<int> clear() async {
    return await _box.clear();
  }

  /// To encode data
  static String toJsonEncode(dynamic value) {
    try {
      return json.encode(value);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// To decode data
  static dynamic toJsonDecode(String value) {
    try {
      return json.decode(value);
    } catch (e) {
      throw Exception(e);
    }
  }
}
