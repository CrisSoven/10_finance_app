import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Inicio"),
          ElevatedButton(
            onPressed: () => _logout(),
            child: const Text("Cerrar sesión"),
          ),
        ],
      )),
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
