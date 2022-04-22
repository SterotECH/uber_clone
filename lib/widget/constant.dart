import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String hint, String label, Icon icon) {
  return InputDecoration(
    prefixIcon: icon,
    filled: true,
    fillColor: Colors.blueGrey[700],
    hintText: hint,
    labelText: label,
    hintStyle: const TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.white,
      fontSize: 12,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    labelStyle: const TextStyle(
      color: Colors.grey,
    ),
  );
}
