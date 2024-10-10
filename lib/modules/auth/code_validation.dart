import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CodeValidation extends StatefulWidget {
  const CodeValidation({super.key});

  @override
  State<CodeValidation> createState() => _CodeValidationState();
}

class _CodeValidationState extends State<CodeValidation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _code = TextEditingController();

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
                          hintText: "000000",
                          label: Text("Código de verificación"),
                          prefixIcon: Icon(Icons.email_outlined)),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: _code,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El código es requerido";
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
                        child: const Text("Validar código"),
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
      Navigator.pushNamed(context, '/change-password');
    }
  }
}
