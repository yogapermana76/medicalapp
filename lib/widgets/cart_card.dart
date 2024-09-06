import 'package:flutter/material.dart';
import 'package:medicalapp/models/cart_model.dart';
import 'package:medicalapp/providers/cart_provider.dart';
import 'package:medicalapp/theme.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard(this.cart, {super.key});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/obat_batuk.png'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.medicine.name!,
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Text(
                      'Rp. ${cart.medicine.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () => cartProvider.addQuatity(cart.medicine),
                    icon: Icon(Icons.add, color: primaryColor),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(height: 2),
                  IconButton(
                    onPressed: () => cartProvider.reduceQuantity(cart.medicine),
                    icon: Icon(Icons.minimize, color: primaryColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(
                  onTap: () => cartProvider.removeCart(cart.medicine),
                  child: Row(children: [
                    Icon(Icons.delete, size: 20, color: alertColor),
                    Text(
                      'Remove',
                      style: alertTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                  ])),
            ],
          ),
        ]));
  }
}
