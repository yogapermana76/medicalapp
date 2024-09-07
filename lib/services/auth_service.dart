import 'dart:convert';

import 'package:medicalapp/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:medicalapp/utils/error.utils.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:3000/api';

  Future<UserModel> register({
    required String name,
    required String email,
    required String role,
    required String password,
  }) async {
    final url = '$baseUrl/register';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(
        {'name': name, 'email': email, 'role': role, 'password': password});

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];
      final user = UserModel.fromJson(data);
      return user;
    } else {
      throw extractErrorMessage(response.body);
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final url = '$baseUrl/login';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];
      final user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';
      return user;
    } else {
      throw extractErrorMessage(response.body);
    }
  }
}
