import 'package:flutter/material.dart';
import 'package:medicalapp/models/medicine_model.dart';
import 'package:medicalapp/pages/edit_profile_page.dart';
import 'package:medicalapp/providers/cart_provider.dart';
import 'package:medicalapp/providers/medicine_provider.dart';
import 'package:medicalapp/providers/order_provider.dart';
import 'package:provider/provider.dart';
import 'package:medicalapp/pages/cart_page.dart';
import 'package:medicalapp/pages/checkout_page.dart';
import 'package:medicalapp/pages/checkout_success_page.dart';
import 'package:medicalapp/pages/detail_chat_page.dart';
import 'package:medicalapp/pages/login_page.dart';
import 'package:medicalapp/pages/main_page.dart';
import 'package:medicalapp/pages/detail_medicine_page.dart';
import 'package:medicalapp/pages/register_page.dart';
import 'package:medicalapp/pages/splash_page.dart';
import 'package:medicalapp/providers/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => MedicineProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => OrderProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: {
            '/splash': (_) => const SplashPage(),
            '/login': (_) => const LoginPage(),
            '/register': (_) => const RegisterPage(),
            '/home': (_) => const MainPage(),
            '/detail-chat': (_) => const DetailChatPage(),
            '/detail-medicine': (contex) =>
                DetailMedicinePage(context as MedicineModel),
            '/edit-profile': (_) => const EditProfilePage(),
            '/cart': (_) => const CartPage(),
            '/checkout': (_) => const CheckoutPage(),
            '/checkout-success': (_) => const CheckoutSuccessPage(),
          },
        ));
  }
}
