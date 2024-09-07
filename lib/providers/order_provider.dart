import 'package:flutter/material.dart';
import 'package:medicalapp/models/cart_model.dart';
import 'package:medicalapp/services/order_service.dart';

class OrderProvider with ChangeNotifier {
  Future checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      return await OrderService().checkout(token, carts, totalPrice);
    } catch (e) {
      rethrow;
    }
  }
}
