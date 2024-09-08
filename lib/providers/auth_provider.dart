import 'package:flutter/material.dart';
import 'package:medicalapp/models/user_model.dart';
import 'package:medicalapp/services/auth_service.dart';
import 'package:medicalapp/utils/local_torage.utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user!;

  bool get isAuthenticated => _user != null;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future register({
    required String name,
    required String role,
    required String email,
    required String password,
  }) async {
    try {
      return await AuthService().register(
        name: name,
        role: role,
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;

      // Save user data to SharedPreferences
      await saveObject<UserModel>('user', user, UserModel.fromJson);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loadUser() async {
    final user = await getObject<UserModel>('user', UserModel.fromJson);
    _user = user;
    notifyListeners();
  }

  void logout() async {
    _user = null;
    // Clear user data from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    notifyListeners();
  }
}
