import 'package:flutter/material.dart';

class InputDEcorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 3)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.purple) : null);
  }
}
