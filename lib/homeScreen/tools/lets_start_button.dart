import 'package:flutter/material.dart';
import '../../app_tools/services.dart';

class LetsStartButton extends StatelessWidget {
  const LetsStartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side:
        const BorderSide(color: Colors.blueAccent, width: 2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      onPressed: () async {
        Services.letsStart();
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Text("Let's Start",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
