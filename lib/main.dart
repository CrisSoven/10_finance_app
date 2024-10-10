 import 'package:finances_app/modules/auth/change_password.dart';
import 'package:finances_app/modules/auth/code_validation.dart';
import 'package:finances_app/modules/auth/forgot_password.dart';
import 'package:finances_app/modules/auth/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/forgot-password': (context) => const ForgotPassword(),
        '/code-validation': (context) => const CodeValidation(),
        '/change-password': (context) => const ChangePassword(),
      },
    );
  }
}
