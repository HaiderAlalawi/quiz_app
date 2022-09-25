import 'package:computiqquizapp/app_tools/app_theme.dart';
import 'package:flutter/material.dart';

class TeamName extends StatelessWidget {
  const TeamName({
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
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 24,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          color: AppTheme.mainColor,
        ),
      ),
    );
  }
}