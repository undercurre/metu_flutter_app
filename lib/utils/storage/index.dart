import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 封装 SharedPreferences。
class LocalStorage {
  // 单例生命。
  factory LocalStorage() => _instance;

  LocalStorage._internal();

  static final LocalStorage _instance = LocalStorage._internal();

  // 保持一个sp的引用
  static late final SharedPreferences _sp;

  /// 初始化方法，只调用一次
  static Future<LocalStorage> init() async {
    _sp = await SharedPreferences.getInstance();
    return _instance;
  }

  /// 写入数据
  static void setItem<T>(String key, T value) {
    Type type = value.runtimeType;
    switch (type) {
      case String:
        _sp.setString(key, value as String);
        break;
      case int:
        _sp.setString(key, value.toString());
        break;
      case bool:
        _sp.setString(key, value.toString());
        break;
      case double:
        _sp.setString(key, value.toString());
        break;
    }
  }

  /// 根据key读取数据，
  static String getItem<T>(String key) {
    var value = _sp.get(key);
    return value.toString();
  }

  /// -------------其他方法封装-----------------
  /// 获取所有的key
  static Set<String> getKeys() {
    return _sp.getKeys();
  }
  /// 判断数据中是否包含某个key
  static bool containsKey(String key) {
    return _sp.containsKey(key);
  }
  /// 删除数据中某个key
  static Future<bool> remove(String key) async {
    return await _sp.remove(key);
  }
  /// 清空所有数据
  static Future<bool> clear() async {
    return await _sp.clear();
  }
  /// 重新加载
  static Future<void> reload() async {
    return await _sp.reload();
  }
}