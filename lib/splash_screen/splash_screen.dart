import 'dart:async';
import 'package:flutter/material.dart';
import '../login_screen/LoginScreen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(BuildContext context) => LoginPage()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/movelogo.gif',
          width: double.maxFinite,
          fit: BoxFit.fitWidth,
          ),
      ),
    );
  }
}
