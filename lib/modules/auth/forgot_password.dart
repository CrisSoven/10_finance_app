import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();

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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Escribe tu correo electrónico';
                        }

                        if (!value.contains('@')) {
                          return 'Correo electrónico inválido';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _validateForm(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Enviar código"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/code-validation');
    }
  }
}
