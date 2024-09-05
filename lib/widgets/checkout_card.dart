import 'package:flutter/material.dart';
import 'package:medicalapp/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/obat_batuk.jpg'),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Obat Batuk Herbal',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 2),
                Text(
                  'Rp. 15.000',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '2 Items',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
