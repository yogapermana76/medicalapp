import 'package:flutter/material.dart';
import 'package:medicalapp/models/user_model.dart';
import 'package:medicalapp/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String role,
    required String email,
    required String password,
  }) async {
    try {
      final user = await AuthService().register(
        name: name,
        role: role,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      debugPrint('$e');
      return false;
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
      return true;
    } catch (e) {
      debugPrint('$e');
      return false;
    }
  }
}
