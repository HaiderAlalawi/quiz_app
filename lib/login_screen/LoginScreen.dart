import 'dart:developer';

import 'package:computiqquizapp/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_border.dart';
import 'package:get/get.dart';

import '../app_tools/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController usernameControl=TextEditingController();
TextEditingController passwordControl=TextEditingController();

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
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 80),
          children: <Widget>[
            Image.asset('images/image.png'),
            textField(title: 'Username',isSecure: false, controller: usernameControl),
            textField(title: 'Password',isSecure: true, controller: passwordControl),

            Container(
              height: 45,
              child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF1A8CF7)), ),
                onPressed: (){
               // Services.signIn();
                Services.getQuestion('f8517441-0941-45b1-83b2-1701b69aee7a');
                 // Get.offAll(HomePage());
                },
                child: Text('login' ,style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            )

          ],
        ),
      ),

    );
  }

  Padding textField({required String title, required bool isSecure,required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        controller: controller ,
        textInputAction: TextInputAction.next, // Moves focus to next.
        obscureText: isSecure,
        decoration: InputDecoration(border: const OutlineInputBorder(),
                 labelText: title,
               ),
            ),
    );
  }
}
