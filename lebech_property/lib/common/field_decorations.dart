import 'package:flutter/material.dart';

InputDecoration formFieldDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    border: const OutlineInputBorder(),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: ''
  );
}