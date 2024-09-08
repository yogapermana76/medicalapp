import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medicalapp/providers/auth_provider.dart';
import 'package:medicalapp/providers/medicine_provider.dart';
import 'package:medicalapp/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Provider.of<MedicineProvider>(context, listen: false).getMedicines();

    // ignore: use_build_context_synchronously
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.loadUser(); // Load user from SharedPreferences

    if (authProvider.isAuthenticated) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/desktopip_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
