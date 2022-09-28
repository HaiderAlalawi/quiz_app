import 'package:flutter/material.dart';

class LogoImageAppBar extends StatelessWidget {
  const LogoImageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/Logo.png",
      height: 100,
      width: 100,
    );
  }
}
