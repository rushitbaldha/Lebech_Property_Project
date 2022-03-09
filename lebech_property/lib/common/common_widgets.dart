import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/screens/sign_in_screen/sign_in_screen.dart';

class FormMainHeaderModule extends StatelessWidget {
  final String text;
  const FormMainHeaderModule({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class FormSubHeaderModule extends StatelessWidget {
  final String text;
  const FormSubHeaderModule({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16),
    );
  }
}

PreferredSizeWidget customAppBar({String? title}) {
  return AppBar(
    title: Text(
      '$title',
      style: const TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    actions: [
      IconButton(onPressed: (){
        Get.to(() => SignInScreen());
      }, icon: const Icon(Icons.login_rounded)),
    ],
  );
}

class HeadingModule extends StatelessWidget {
  final String heading;
  const HeadingModule({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
