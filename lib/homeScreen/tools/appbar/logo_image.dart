import 'package:computiqquizapp/core/Responsive/responsive_screen.dart';
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
    required ResponsiveScreenApp sizeResponsove,
  }) : _sizeResponsove = sizeResponsove, super(key: key);

  final ResponsiveScreenApp _sizeResponsove;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/image.png",
      width: _sizeResponsove.iconAppBar,
    );
  }
}
