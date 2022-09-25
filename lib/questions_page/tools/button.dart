import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onPress,
    required this.color,
  }) : super(key: key);
  final String text;
  final void Function() onPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 156,
      child: TextButton(
        onPressed: () {
          onPress();
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color,
          primary: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
