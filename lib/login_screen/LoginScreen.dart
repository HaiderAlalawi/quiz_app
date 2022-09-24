import 'package:computiqquizapp/login_screen/tools/login_button.dart';
import 'package:computiqquizapp/login_screen/tools/login_textField.dart';
import 'package:flutter/material.dart';

final usernameControl = TextEditingController();
final passwordControl = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 150),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/image.png',
                  width: 250,
                ),
                LoginTextField(
                    title: 'Username',
                    isSecure: false,
                    controller: usernameControl),
                LoginTextField(
                    title: 'Password',
                    isSecure: true,
                    controller: passwordControl),
                const Center(child: LoginButton())
              ],
            )
          ],
        ),
      ),
    );
  }
}
