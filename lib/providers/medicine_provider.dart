import 'package:flutter/material.dart';
import 'package:medicalapp/models/medicine_model.dart';
import 'package:medicalapp/services/medicine_service.dart';

class MedicineProvider extends ChangeNotifier {
  List<MedicineModel> _medicines = [];

  List<MedicineModel> get medicines => _medicines;

  set medicines(List<MedicineModel> medicines) {
    _medicines = medicines;
    notifyListeners();
  }

  Future<void> getMedicines() async {
    try {
      List<MedicineModel> medicines = await MedicineService().getMedicines();
      _medicines = medicines;
    } catch (e) {
      debugPrint('$e');
    }
  }
}
