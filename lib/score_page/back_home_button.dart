import 'package:computiqquizapp/app_tools/app_theme.dart';
import 'package:computiqquizapp/app_tools/services.dart';
import 'package:flutter/material.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.maxFinite,
          color: AppTheme.mainColor,
          height: 50,
          child: TextButton(onPressed: ()=> Services.backToHome(),
            child:const Text('Back to Home page',style: TextStyle(color: AppTheme.textColor,fontSize: 16,fontWeight: FontWeight.bold),) ,),
        )
    );
  }
}
