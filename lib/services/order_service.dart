import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicalapp/models/cart_model.dart';

class OrderService {
  final String baseUrl = 'http://127.0.0.1:3000/api';

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalAmount,
  ) async {
    final url = '$baseUrl/order';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    final body = jsonEncode({
      'items': carts
          .map((cart) => {
                'id': cart.medicine.id,
                'quantity': cart.quantity,
                'price': cart.medicine.price,
              })
          .toList(),
      'status': 'pending',
      'total_amount': totalAmount,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal melakukan checkout');
    }
  }
}
