import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Function to save a string value
Future<void> saveString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

// Function to get a string value
Future<String?> getString(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

// Function to save an integer value
Future<void> saveInt(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}

// Function to get an integer value
Future<int?> getInt(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

// Function to save a list of strings as JSON
Future<void> saveStringList(String key, List<String> list) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = jsonEncode(list);
  await prefs.setString(key, jsonList);
}

// Function to get a list of strings from JSON
Future<List<String>> getStringList(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = prefs.getString(key);
  if (jsonList != null) {
    final List<dynamic> decodedList = jsonDecode(jsonList);
    return List<String>.from(decodedList);
  }
  return [];
}

// Function to save a generic object as JSON
Future<void> saveObject<T>(
    String key, T object, T Function(Map<String, dynamic>) fromJson) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = jsonEncode(object);
  await prefs.setString(key, jsonString);
}

// Function to get a generic object from JSON
Future<T?> getObject<T>(
    String key, T Function(Map<String, dynamic>) fromJson) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString(key);
  if (jsonString != null) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return fromJson(jsonMap);
  }
  return null;
}
