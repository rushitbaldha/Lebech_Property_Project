import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();
}