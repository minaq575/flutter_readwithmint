// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Icon icon;
  final String label;

  const MyTextInput({
    super.key,
    required this.hintText,
    required this.keyboardType,
    // ignore: non_constant_identifier_names
    this.onChanged,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          suffixIcon: icon,
          hintStyle: const TextStyle(
            color: Colors.redAccent,
            fontFamily: 'Thai',
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
