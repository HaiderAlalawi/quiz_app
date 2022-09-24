import 'package:flutter/material.dart';

import '../../app_tools/services.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: SizedBox(
        height: 45,
        width: 120 ,
        child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF1A8CF7)), ),
          onPressed: (){
            Services.signIn();
          },
          child: const Text('login' ,style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
      ),
    );
  }
}
