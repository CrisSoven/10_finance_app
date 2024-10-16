import 'package:finances_app/modules/auth/register.dart';
import 'package:finances_app/modules/navigation/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:finances_app/modules/auth/change_password.dart';
import 'package:finances_app/modules/auth/code_validation.dart';
import 'package:finances_app/modules/auth/forgot_password.dart';
import 'package:finances_app/modules/auth/login.dart';
import 'package:finances_app/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/forgot-password': (context) => const ForgotPassword(),
        '/code-validation': (context) => const CodeValidation(),
        '/change-password': (context) => const ChangePassword(),
        '/register': (context) => const Register(),
        '/menu': (context) => const Home(),
      },
    );
  }
}
