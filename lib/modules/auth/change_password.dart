import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  bool _isOscurePassword = true;
  bool _isOscureNewPass = true;

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
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: "········",
                        label: const Text("Contraseña"),
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          onPressed: () => setState(
                              () => _isOscurePassword = !_isOscurePassword),
                          icon: Icon(
                            _isOscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      obscureText: _isOscurePassword,
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "La contraseña es requerida";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        hintText: "········",
                        label: const Text("Repetir contraseña"),
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          onPressed: () => setState(
                              () => _isOscureNewPass = !_isOscureNewPass),
                          icon: Icon(
                            _isOscureNewPass
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      obscureText: _isOscureNewPass,
                      controller: _newPass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "La contraseña es requerida";
                        }

                        if (value != _password.text) {
                          return "Las contraseñas no coinciden";
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
                            foregroundColor: Colors.white),
                        child: const Text("Guardar"),
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
      Navigator.pushNamed(context, '/login');
    }
  }
}
