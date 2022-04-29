import 'package:shared_preferences/shared_preferences.dart';

import 'i_local_storage.dart';

class SharedPreferencesLocalStorage implements ILocalStorage {
  SharedPreferencesLocalStorage() {
    _instance = SharedPreferences.getInstance();
  }

  late Future<SharedPreferences> _instance;
  Future<SharedPreferences> get instance => _instance;

  @override
  Future<T?> read<T>(String key) async {
    final sharedPreferences = await instance;
    if (T == String) {
      return sharedPreferences.getString(key) as T?;
    } else if (T == bool) {
      return sharedPreferences.getBool(key) as T?;
    } else if (T == int) {
      return sharedPreferences.getInt(key) as T?;
    } else if (T == double) {
      return sharedPreferences.getDouble(key) as T?;
    } else if (T == List) {
      return sharedPreferences.getStringList(key) as T?;
    } else {
      throw Exception('Type not supported');
    }
  }

  @override
  Future<void> write<T>(String key, T value) async {
    final sharedPreferences = await instance;
    if (T == String) {
      await sharedPreferences.setString(key, value as String);
    } else if (T == bool) {
      await sharedPreferences.setBool(key, value as bool);
    } else if (T == int) {
      await sharedPreferences.setInt(key, value as int);
    } else if (T == double) {
      await sharedPreferences.setDouble(key, value as double);
    } else if (T == List) {
      await sharedPreferences.setStringList(key, value as List<String>);
    } else {
      throw Exception('Type not supported');
    }
  }

  @override
  Future<bool> contains(String key) async {
    final sharedPreferences = await instance;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await instance;
    sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() async {
    final sharedPreferences = await instance;
    await sharedPreferences.clear();
  }
}
