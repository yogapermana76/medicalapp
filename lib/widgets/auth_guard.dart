import 'package:flutter/material.dart';
import 'package:medicalapp/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:medicalapp/providers/auth_provider.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user?.token != null) {
      return child;
    } else {
      return const LoginPage();
    }
  }
}
