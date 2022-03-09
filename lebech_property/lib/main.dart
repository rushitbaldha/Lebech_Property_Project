import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Lebech Property Application",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
