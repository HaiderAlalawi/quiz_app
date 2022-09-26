import 'package:computiqquizapp/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_tools/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Computiq Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}



class ButtonWidget extends StatelessWidget {
  final text;
  final onClcked;
  const ButtonWidget({Key? key, required this.text, required this.onClcked})
      : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: AppTheme.mainColor, onPrimary: Colors.white),
    child: Text(
      text,
      style: TextStyle(fontSize: 18),
    ),
    onPressed: onClcked,
  );
}
