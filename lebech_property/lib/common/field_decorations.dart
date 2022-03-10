import 'package:flutter/material.dart';

InputDecoration formFieldDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
  );
}