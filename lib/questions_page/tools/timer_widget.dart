import 'package:computiqquizapp/app_tools/app_theme.dart';
import 'package:get/get.dart';
import 'package:computiqquizapp/app_tools/data.dart';
import 'package:flutter/material.dart';
import 'timer_seconds.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Obx(() {
                  return CircularProgressIndicator(
                    value: AppData.seconds.value / 1,
                    strokeWidth: 5,
                    valueColor: const AlwaysStoppedAnimation(AppTheme.red),
                  );
                }
              ),
              Obx(() {
                  return CircularProgressIndicator(
                    value: AppData.seconds.value / AppData.questionData.seconds ,
                    strokeWidth: 5,
                    valueColor: const AlwaysStoppedAnimation(AppTheme.mainColor),
                  );
                }
              ),
              const Center(
                    child: TimerSecond(),
               ),
            ],
          ),
        );

  }
}

