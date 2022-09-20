import 'package:computiqquizapp/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_border.dart';
import 'package:get/get.dart';


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
          padding: EdgeInsets.symmetric(horizontal: 15.0,),
          children: <Widget>[
            Column(
              children: <Widget> [
                SizedBox(height: 80,),
                Image.asset('images/image.png')
              ],
            ),
            SizedBox(height: 40.0,),
            Text("Username" ,style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
             TextField(
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(border: OutlineInputBorder(),
                 labelText: 'Enter your emaill',
               ),
            ),
            SizedBox(height: 40,),
            Text("Password",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
            TextField(
              obscureText: true,
              decoration: InputDecoration(border: OutlineInputBorder(),
                labelText: 'Enter your pasword',
              ),
            ),
            SizedBox(height: 60,),
            Column(
              children: <Widget>[
                ButtonTheme(
                  height: 45,
                  disabledColor: Color(0xFF1A8CF7),
                  child: TextButton(
                    onPressed: (){

                      Get.offAll(HomePage());
                    },
                    child: Text('login' ,style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                )

              ],
            )

          ],
        ),
      ),

    );
  }
}
