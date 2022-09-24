import 'package:computiqquizapp/core/Responsive/responsive_screen.dart';
import 'package:flutter/material.dart';

class ImageClip extends StatelessWidget {
  const ImageClip({
    Key? key,
    required ResponsiveScreenApp sizeResponsove,
  }) : _sizeResponsove = sizeResponsove, super(key: key);

  final ResponsiveScreenApp _sizeResponsove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius:  BorderRadius.only(
          bottomRight: Radius.circular(_sizeResponsove.radiusImageApp),
          bottomLeft: Radius.circular(_sizeResponsove.radiusImageApp),
        ),
        child: Image.asset(
          "images/cover.png",
          height: _sizeResponsove.heightRadiusImageApp,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
