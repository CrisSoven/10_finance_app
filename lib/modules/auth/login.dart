import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png', width: 150, height: 150),
                    const SizedBox(height: 64),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: "tu@correo.com",
                          label: Text("Correo electrónico"),
                          prefixIcon: Icon(Icons.email_outlined)),
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: "········",
                        label: const Text("Contraseña"),
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          onPressed: () => setState(() => _isObscure = !_isObscure),
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      obscureText: _isObscure,
                      controller: _pass,
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white),
                        child: const Text("Iniciar sesión"),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: const Text("Recuperar contraseña")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
