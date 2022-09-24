import 'package:computiqquizapp/app_tools/services.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class BuildSheetContainer extends StatelessWidget {
  const BuildSheetContainer({
    Key? key,
    required this.text,
    required this.pressed,
  }) : super(key: key);
  final String text;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7, right: 20, left: 20),
      child: Container(
        height: 60,
        width: 156,
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.borderColor, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: TextButton(
          onPressed:(){
            pressed();
          },
          style: TextButton.styleFrom(
            primary: AppTheme.textColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Icon(
                  Icons.play_arrow_rounded,
                  color: AppTheme.mainColor,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}