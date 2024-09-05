import 'package:flutter/material.dart';
import 'package:medicalapp/theme.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/medicine_detail'),
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
                      'Obat Batuk Anak',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Rp. 20.000',
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
