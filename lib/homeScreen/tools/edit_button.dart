import 'package:flutter/material.dart';

class EditTeamNumber extends StatelessWidget {
  const EditTeamNumber({
    Key? key, required this.pressed, required this.myIcon,
  }) : super(key: key);

  final Function pressed;
  final IconData myIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          pressed();
        },
        child: Icon(
          myIcon,
          color: Colors.white,
          size: 25,
        ));
  }
}

