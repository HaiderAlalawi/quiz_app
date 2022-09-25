import 'package:computiqquizapp/app_tools/services.dart';
import 'package:flutter/material.dart';
import '../../app_tools/app_theme.dart';

class Options extends StatelessWidget {
    const Options({
    Key? key,
    required this.text, required this.correct, this.questionPoint, this.color,
  }) : super(key: key);
  final String text;
  final bool correct;
  final int? questionPoint;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, bottom: 13),
      child: SizedBox(
        height: 53,
        width: double.maxFinite,
        child: TextButton(
                  onPressed: ()=> Services.endAnswer(correct, questionPoint?? 0) ,
                  style: TextButton.styleFrom(
                    alignment: Alignment.center,
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    backgroundColor: color,
                    primary: AppTheme.textColor,
                    //padding: EdgeInsets.only(bottom: 25, top: 25),
                  ),
                  child: Text(text),
                )
      ),
    );
  }
}

