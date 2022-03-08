import 'package:flutter/material.dart';

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
