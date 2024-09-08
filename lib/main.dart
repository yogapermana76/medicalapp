import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'package:medicalapp/widgets/auth_guard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // Load .env file
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
            '/detail-chat': (context) {
              final args = ModalRoute.of(context)!.settings.arguments
                  as Map<String, int>;
              return AuthGuard(
                child: DetailChatPage(
                  chatId: args['chatId']!,
                  userId: args['userId']!,
                  name: args['name'] as String,
                ),
              );
            },
            '/detail-medicine': (context) =>
                AuthGuard(child: DetailMedicinePage(context as MedicineModel)),
            '/edit-profile': (_) => const AuthGuard(child: EditProfilePage()),
            '/cart': (_) => const AuthGuard(child: CartPage()),
            '/checkout': (_) => const AuthGuard(child: CheckoutPage()),
            '/checkout-success': (_) =>
                const AuthGuard(child: CheckoutSuccessPage()),
          },
        ));
  }
}
