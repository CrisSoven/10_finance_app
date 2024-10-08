import 'package:flutter/material.dart';

class CodeValidation extends StatefulWidget {
  const CodeValidation({super.key});

  @override
  State<CodeValidation> createState() => _CodeValidationState();
}

class _CodeValidationState extends State<CodeValidation> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 150, height: 150),
                  const SizedBox(height: 64),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        hintText: "123456",
                        label: Text("Código de verificación"),
                        prefixIcon: Icon(Icons.email_outlined)),
                    keyboardType: TextInputType.number,
                    controller: _email,
                  ),
                  const SizedBox(height: 32.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      child: const Text("Enviar código"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
