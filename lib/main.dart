import 'package:flutter/material.dart';
import 'package:mini_ui_project/get_started.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mini_ui_project/screens/Address/Address_Screen.dart';
import 'package:mini_ui_project/screens/BuyScreen.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddressScreen(),
    );
  }
}
