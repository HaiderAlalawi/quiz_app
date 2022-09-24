
import 'package:computiqquizapp/core/Responsive/responsive_screen.dart';
import 'package:flutter/cupertino.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({
    Key? key,
    required ResponsiveScreenApp sizeResponsove, required this.text,
  }) : _sizeResponsove = sizeResponsove, super(key: key);

  final ResponsiveScreenApp _sizeResponsove;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            style: TextStyle(fontSize: _sizeResponsove.textResponsiveApp, fontWeight: FontWeight.bold),
          )),
    );
  }
}

