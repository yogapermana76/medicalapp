import 'package:flutter/material.dart';
import 'package:medicalapp/pages/login_page.dart';
import 'package:medicalapp/pages/main_page.dart';
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
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (_) => const MainPage(),
      },
    );
  }
}
