import 'dart:async';

import 'package:flutter/material.dart';
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
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<MedicineProvider>(context, listen: false).getMedicines();
    if (mounted) {
      Timer(const Duration(seconds: 2),
          () => Navigator.pushNamed(context, '/login'));
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
