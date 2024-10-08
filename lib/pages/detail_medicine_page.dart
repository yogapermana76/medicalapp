import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/models/medicine_model.dart';
import 'package:medicalapp/pages/detail_chat_page.dart';
import 'package:medicalapp/providers/auth_provider.dart';
import 'package:medicalapp/providers/cart_provider.dart';
import 'package:medicalapp/services/chat_service.dart';
import 'package:medicalapp/theme.dart';
import 'package:medicalapp/utils/format_number.dart';
import 'package:provider/provider.dart';

class DetailMedicinePage extends StatefulWidget {
  const DetailMedicinePage(this.medicine, {super.key});

  final MedicineModel medicine;

  @override
  State<DetailMedicinePage> createState() => _DetailMedicinePageState();
}

class _DetailMedicinePageState extends State<DetailMedicinePage> {
  final List images = [
    'assets/images/obat_batuk.png',
    'assets/images/obat_batuk.png',
    'assets/images/obat_batuk.png'
  ];

  int currentIndex = 0;

  void creatChat() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.user;

    try {
      final chat =
          await ChatService().createChat(userId: user!.id, doctorId: 32);

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatPage(
              chatId: chat.id,
              userId: user.id,
              name: chat.doctor!.user.name,
            ),
          ),
        );
      }
    } catch (e) {
      final errorMessage = e.toString();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.values[2],
            backgroundColor: alertColor,
            content: Text(
              errorMessage,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.user;

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (_) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Icon(Icons.check_circle, color: primaryColor, size: 100),
                  const SizedBox(height: 12),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    void addToCart() {
      if (user?.role == 'patient') {
        cartProvider.addCart(widget.medicine);
        showSuccessDialog();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: const Text(
              'Only patients can add to cart',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    void navigateToCart() {
      if (user?.role == 'patient') {
        Navigator.pushNamed(context, '/cart');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: const Text(
              'Only patients can view cart',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : const Color(0xffC4C4C4),
        ),
      );
    }

    Widget header() {
      // awal index = -1;
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.chevron_left),
                ),
                GestureDetector(
                  onTap: navigateToCart,
                  child: Icon(
                    Icons.shopping_bag,
                    color: backgroundColor1,
                  ),
                )
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map((image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, _) {
                setState(() => currentIndex = index);
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((_) {
              index++; // ketika index++ maka index awal -1 menjadi 0
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 17),
          padding: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            color: backgroundColor1,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // NOTE: HEADER
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.medicine.name!,
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // NOTE: PRICE
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: defaultMargin),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: primaryTextStyle,
                      ),
                      Text(
                        NumberUtils.formatPrice(widget.medicine.price!),
                        style: priceTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                // NOTE: DESCRIPTION
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.medicine.description!,
                        style: subtitleTextStyle.copyWith(fontWeight: light),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget customBottomNav() {
      final List<Widget> bottomNavItems = [];

      if (user?.role == 'patient') {
        bottomNavItems.add(
          GestureDetector(
            onTap: creatChat,
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primaryColor),
              ),
              child: Icon(Icons.chat, color: primaryColor),
            ),
          ),
        );
        bottomNavItems.add(const SizedBox(width: 16));
      }

      bottomNavItems.add(
        Expanded(
          child: SizedBox(
            width: 54,
            height: 54,
            child: TextButton(
              onPressed: addToCart,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: primaryColor,
              ),
              child: Text(
                'Add to Cart',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
        ),
      );

      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 16,
        ),
        color: backgroundColor1,
        child: Row(
          children: bottomNavItems,
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
