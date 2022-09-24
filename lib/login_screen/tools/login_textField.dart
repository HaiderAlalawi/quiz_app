
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.title,
    required this.isSecure,
    required this.controller,
  }) : super(key: key);

  final String title;
  final bool isSecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    String? error;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        controller: controller ,
        textInputAction: TextInputAction.next, // Moves focus to next.
        obscureText: isSecure,
        decoration: InputDecoration(border: const OutlineInputBorder(),
            labelText: title,errorText: error
        ),
      ),
    );
  }
}