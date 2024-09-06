import 'package:medicalapp/models/medicine_model.dart';

class CartModel {
  final MedicineModel medicine;
  int quantity;

  CartModel({
    required this.medicine,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        medicine: MedicineModel.fromJson(json['medicine']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'medicine': medicine.toJson(),
        'quantity': quantity,
      };

  double getTotalPrice() => medicine.price * quantity;
}
