import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/screens/sign_in_screen/sign_in_screen_widgets.dart';
import '../../common/common_widgets.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: signInScreenController.formKey,
              child: Obx(() => signInScreenController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const FormMainHeaderModule(text: 'Sign In'),
                        const SizedBox(height: 10),
                        const FormMainHeaderModule(text: 'To Your Account'),
                        const SizedBox(height: 15),
                        const FormSubHeaderModule(
                            text:
                                'Lorem ipsum dolor, sit amet consectetur adipisicing elit. '
                                'Sit aliquid, Non distinctio vel iste.'),
                        const SizedBox(height: 30),
                        SignInPhoneNoTextFieldModule(),
                        const SizedBox(height: 10),
                        SignInPasswordFieldModule(),
                        const SizedBox(height: 30),
                        const ForgotPasswordModule(),
                        const SizedBox(height: 30),
                        SignInButtonModule(),
                        const SizedBox(height: 30),
                        SignUpTextModule(),
                        const SizedBox(height: 30),
                      ],
                    )),
            ),
          ),
        ),
      ),
    );
  }
}
