import 'package:flutter/material.dart';
import 'package:medicalapp/models/cart_model.dart';
import 'package:medicalapp/services/order_service.dart';

class OrderProvider with ChangeNotifier {
  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      if (await OrderService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('$e');
      return false;
    }
  }
}
