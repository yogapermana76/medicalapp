import 'package:flutter/material.dart';
import 'package:medicalapp/models/medicine_model.dart';
import 'package:medicalapp/pages/detail_medicine_page.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/utils/format_number.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.medicine, {super.key});

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
          width: 215,
          height: 278,
          margin: EdgeInsets.only(right: defaultMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffECEDEF),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/obat_batuk.png',
                width: 215,
                height: 150,
                fit: BoxFit.contain,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name!,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      NumberUtils.formatPrice(medicine.price!),
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
