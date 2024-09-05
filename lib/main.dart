import 'package:flutter/material.dart';
import 'package:medicalapp/pages/cart_page.dart';
import 'package:medicalapp/pages/checkout_page.dart';
import 'package:medicalapp/pages/checkout_success_page.dart';
import 'package:medicalapp/pages/detail_chat_page.dart';
import 'package:medicalapp/pages/login_page.dart';
import 'package:medicalapp/pages/main_page.dart';
import 'package:medicalapp/pages/medicine_detail_page.dart';
import 'package:medicalapp/pages/register_page.dart';
import 'package:medicalapp/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/home': (_) => const MainPage(),
        '/detail-chat': (_) => const DetailChatPage(),
        '/medicine_detail': (_) => const MedicineDetailPage(),
        '/cart': (_) => const CartPage(),
        '/checkout': (_) => const CheckoutPage(),
        '/checkout-success': (_) => const CheckoutSuccessPage(),
      },
    );
  }
}
