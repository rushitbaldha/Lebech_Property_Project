import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import '../../common/field_decorations.dart';
import '../../common/field_validations.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import '../home_screen/home_screen.dart';

class SignInEmailTextFieldModule extends StatelessWidget {
  SignInEmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.emailTextField,
      keyboardType: TextInputType.emailAddress,
      decoration: formFieldDecoration(hintText: 'Email Address'),
      validator: (value) => FieldValidations().validateEmail(value!),
    );
  }
}

class SignInPasswordFieldModule extends StatelessWidget {
  SignInPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.passwordTextField,
      keyboardType: TextInputType.text,
      decoration: formFieldDecoration(hintText: 'Password'),
      validator: (value) => FieldValidations().validatePassword(value!),
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.formKey.currentState!.validate()){
          Get.off(()=> HomeScreen());
        }
      },
      child: Container(
        decoration: const BoxDecoration(color: AppColors.mainColor),
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'SIGN IN',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordModule extends StatelessWidget {
  const ForgotPasswordModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.centerRight,
        child: const Text(
            'FORGOTTEN YOUR PASSWORD?'
        ),
      ),
    );
  }
}