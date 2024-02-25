// Module
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';

Future<void> clearStorage() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  } catch (e) {
    throw 'Error clearing Storage: $e';
  }
}

Future<void> setItem(String key, dynamic value) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List) {
      await prefs.setStringList(key, value.cast<String>());
    } else {
      throw ArgumentError('Unsupported value type: ${value.runtimeType}');
    }
  } catch (e) {
    throw 'Error setting Storage for key $key: $e';
  }
}

Future<dynamic> getItem(String key) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  } catch (e) {
    return null;
  }
}

Future<void> removeItem(String key) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  } catch (e) {
    throw 'Error removing Storage for key $key: $e';
  }
}
