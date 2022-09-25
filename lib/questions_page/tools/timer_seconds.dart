import 'package:computiqquizapp/app_tools/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerSecond extends StatelessWidget {
  const TimerSecond({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Text(
          "${AppData.seconds.value}",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40),
        );
      }
    );
  }
}