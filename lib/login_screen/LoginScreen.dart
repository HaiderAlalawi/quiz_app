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
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 150),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image.asset('images/image.png',width: 250,),
              textField(title: 'Username',isSecure: false, controller: usernameControl),
              textField(title: 'Password',isSecure: true, controller: passwordControl),
              Center(child: loginButton())

            ],)

          ],
        ),
      ),

    );
  }

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: SizedBox(
                height: 45,
                width: 120 ,
                child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF1A8CF7)), ),
                  onPressed: (){
                    Services.signIn();
                  },
                  child: Text('login' ,style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
    );
  }

  Padding textField({required String title, required bool isSecure,required TextEditingController controller}) {
    String? error;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        controller: controller ,
        textInputAction: TextInputAction.next, // Moves focus to next.
        obscureText: isSecure,
        decoration: InputDecoration(border: const OutlineInputBorder(),
                 labelText: title,errorText: error
               ),
            ),
    );
  }
}
