
import 'package:flutter/material.dart';

import '../../app_tools/app_theme.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        name,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: AppTheme.textColor,
        ),
      ),
    );
  }
}
