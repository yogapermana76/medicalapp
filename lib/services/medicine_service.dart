import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicalapp/config/app_config.dart';
import 'package:medicalapp/models/medicine_model.dart';
import 'package:medicalapp/utils/error.utils.dart';

class MedicineService {
  final String baseUrl = '${AppConfig.apiUrl}/api';

  Future<List<MedicineModel>> getMedicines() async {
    final url = Uri.parse('$baseUrl/medicines');
    final headers = {'Content-Type': 'application/json'};

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List<dynamic>;

      return data
          .map((item) => MedicineModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw extractErrorMessage(response.body);
    }
  }
}
