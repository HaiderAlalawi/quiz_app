import 'dart:async';
import 'package:computiqquizapp/app_tools/app_theme.dart';
import 'package:flutter/material.dart';
import '../login_screen/LoginScreen.dart';

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
        const Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(BuildContext context) => const LoginPage()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backGround,
      body: Center(
        child: Image.asset('images/Logo.gif',
          width: double.maxFinite,
          fit: BoxFit.fitWidth,
          ),
      ),
    );
  }
}
