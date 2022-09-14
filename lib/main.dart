import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:computiqquizapp/questiones_page/questiones.dart';
//import '../questiones_page/questiones.dart';
import 'category_page/category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task three',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuestionesPage(),
    );
  }
}

abstract class AppTheme {
  static const Color mainColor = Color(0xFF33ADF8);
  static const Color textColor = Colors.black;
  static const Color gray = Color(0xFFF1F1F1);
  static const Color borderColor = Color(0xFFC3BFBF);
  static const Color yellow = Color(0xFFFFC63C);
  static const Color green = Color(0xFF92E37E);
  static const Color red = Color(0xFFF44848);
  static const Color gray2 = Color(0xFF575756);
}

/**
 Container(
            child: Image(image: AssetImage("images/image4.jpg")),
          ),
 */
