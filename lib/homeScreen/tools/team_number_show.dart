import 'package:computiqquizapp/app_tools/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamNumberShow extends StatelessWidget {
  const TeamNumberShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(
          horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white),
      child: Obx(() {
        return Text(
          AppData.teamInformation.length.toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 25),
        );
      }
      ),
    );
  }
}
