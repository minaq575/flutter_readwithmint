// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:readwithmint/components/input_with_error_text.dart';

class MyTextInputWithErrorText extends StatelessWidget {
  InputWithErrorText input;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Icon icon;
  final String label;
  MyTextInputWithErrorText({
    super.key,
    required this.input,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText,
        onChanged: (value) {
          input.valueText = value;
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorText: input.errorText,
          hintText: hintText,
          labelText: label,
          suffixIcon: icon,
          hintStyle: const TextStyle(
            color: Colors.redAccent,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
