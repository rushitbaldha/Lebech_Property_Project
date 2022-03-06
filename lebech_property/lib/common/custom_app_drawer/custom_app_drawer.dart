import 'package:flutter/material.dart';

class CustomAppDrawer extends StatelessWidget {
  CustomAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
