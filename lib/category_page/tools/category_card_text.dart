import 'package:flutter/material.dart';

class CategoryCardText extends StatelessWidget {
  const CategoryCardText({
    Key? key,
    required this.title, required this.size, required this.weight, this.color, this.align,
  }) : super(key: key);

  final String title;
  final double size;
  final FontWeight weight;
  final Color? color;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        textAlign:align ,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}
