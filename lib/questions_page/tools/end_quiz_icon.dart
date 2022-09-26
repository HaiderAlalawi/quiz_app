import 'package:computiqquizapp/app_tools/services.dart';
import 'package:flutter/material.dart';

import '../../app_tools/app_theme.dart';
import '../../app_tools/data.dart';

class EndQuizIcon extends StatelessWidget {
  const EndQuizIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: AppData.currentTeam == (AppData.teamInformation.length -1)? true : false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: ()=> Services.endQuiz(),
              icon: const Icon(
                Icons.output_rounded,
                color: AppTheme.red,
                size: 28,
              )),
        ));
  }
}
