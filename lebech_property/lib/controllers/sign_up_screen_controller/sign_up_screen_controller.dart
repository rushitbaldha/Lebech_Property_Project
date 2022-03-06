import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final fullNameTextField = TextEditingController();
  final mobileNoTextField = TextEditingController();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();
  final cPasswordTextField = TextEditingController();
}