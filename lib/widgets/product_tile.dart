import 'package:flutter/material.dart';
import 'package:medicalapp/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Obat Batuk Anak',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 6),
                Text(
                  'Rp. 20.000',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
