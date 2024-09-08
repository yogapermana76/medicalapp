import 'package:flutter/material.dart';
import 'package:medicalapp/models/medicine_model.dart';
import 'package:medicalapp/pages/detail_medicine_page.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/utils/format_number.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard(this.medicine, {super.key});

  final MedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailMedicinePage(medicine),
              ),
            ),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(
            top: 20,
            left: 12,
            bottom: 14,
            right: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor4,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/obat_batuk.jpg', width: 60),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name!,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      NumberUtils.formatPrice(medicine.price!),
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
