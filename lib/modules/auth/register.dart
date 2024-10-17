import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();

  bool _isObscure = true;
  bool _isObscureNewPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
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
                    const SizedBox(height: 32),
                    const Text(
                      "Registrarse",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        hintText: "tu@correo.com",
                        label: Text("Correo electrónico"),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El correo es requerido";
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
                        label: const Text("Contraseña"),
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              setState(() => _isObscure = !_isObscure),
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      obscureText: _isObscure,
                      controller: _pass,
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
                              () => _isObscureNewPass = !_isObscureNewPass),
                          icon: Icon(
                            _isObscureNewPass
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      obscureText: _isObscureNewPass,
                      controller: _newPass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "La contraseña es requerida";
                        }

                        if (value != _pass.text) {
                          return "Las contraseñas no coinciden";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _register(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white),
                        child: const Text("Registrarse"),
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

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _pass.text,
        );

        print(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
