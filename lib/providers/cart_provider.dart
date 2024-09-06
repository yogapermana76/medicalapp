import 'package:flutter/material.dart';
import 'package:medicalapp/models/cart_model.dart';
import 'package:medicalapp/models/medicine_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(MedicineModel medicine) {
    if (medicineExist(medicine)) {
      int index = _carts.indexWhere(
        (element) => element.medicine.id == medicine.id,
      );
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          medicine: medicine,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(MedicineModel medicine) {
    int index = _carts.indexWhere(
      (element) => element.medicine.id == medicine.id,
    );
    _carts.removeAt(index);
    notifyListeners();
  }

  addQuatity(MedicineModel medicine) {
    int index = _carts.indexWhere(
      (element) => element.medicine.id == medicine.id,
    );
    _carts[index].quantity++;
    notifyListeners();
  }

  reduceQuantity(MedicineModel medicine) {
    int index = _carts.indexWhere(
      (element) => element.medicine.id == medicine.id,
    );
    _carts[index].quantity--;
    if (_carts[index].quantity == 0) {
      _carts.removeAt(index);
    }
    notifyListeners();
  }

  int totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  double totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.medicine.price);
    }
    return total;
  }

  medicineExist(MedicineModel medicine) {
    if (_carts.indexWhere((element) => element.medicine.id == medicine.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
