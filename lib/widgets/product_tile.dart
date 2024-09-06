import 'package:flutter/material.dart';
import 'package:medicalapp/models/medicine_model.dart';
import 'package:medicalapp/pages/detail_medicine_page.dart';
import 'package:medicalapp/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.medicine, {super.key});

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
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/obat_batuk.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Rp. ${medicine.price}',
                      style: priceTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
