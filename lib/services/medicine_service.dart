import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalapp/models/medicine_model.dart';

class MedicineService {
  final String _baseUrl = 'http://127.0.0.1:3000/api';

  Future<List<MedicineModel>> getMedicines() async {
    final url = Uri.parse('$_baseUrl/medicines');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(url, headers: headers);
    debugPrint(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;

      return data
          .map((item) => MedicineModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
          'Failed to load medicines. Status code: ${response.statusCode}');
    }
  }
}
