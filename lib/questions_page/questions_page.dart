import 'package:computiqquizapp/app_tools/services.dart';
import 'package:computiqquizapp/questions_page/tools/button.dart';
import 'package:computiqquizapp/questions_page/tools/end_quiz_icon.dart';
import 'package:computiqquizapp/questions_page/tools/options.dart';
import 'package:computiqquizapp/questions_page/tools/question_text.dart';
import 'package:computiqquizapp/questions_page/tools/timer_widget.dart';
import 'package:flutter/material.dart';
import '../app_tools/app_theme.dart';
import '../app_tools/logo_image_app_bar.dart';
import 'tools/build_help_sheet.dart';
import '../app_tools/data.dart';
import 'package:get/get.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  void initState() {
    Services.startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.backGround,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const LogoImageAppBar(),
          actions: const [EndQuizIcon()],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  QuestionText(
                    name: AppData.questionData.title,
                  ),
                  SizedBox(
                    height: 350,
                    child: Obx(() {
                        return ListView(
                          children:AppData.seconds.value == 0? AppData.questionData.answers
                              .map((e) => Options(text: e.title, correct: e.isTrue,
                            color: e.isTrue? AppTheme.green: AppTheme.red
                            ,))
                              .toList(): AppData.questionData.answers
                              .map((e) => Options(text: e.title,questionPoint: AppData.questionData.points, correct: e.isTrue,color: AppTheme.gray,))
                              .toList()
                          ,
                        );
                      }
                    ),
                  ),
                  const Center(child: TimerWidget()),
                ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            text: "Help",
                            color: AppTheme.yellow,
                            onPress: () {
                              AppData.seconds.value != 0? AppData.teamInformation[AppData.currentTeam]['help'].length==0?
                              Services.mySnackBar(title: 'Sorry', titleColor: AppTheme.red, message: 'No more help.')
                                  : bottomSheet(context):null;
                            },
                          ),
                          Button(
                              text: "Next",
                              color: AppTheme.mainColor,
                              onPress: () => Services.nextButton()),

                        ]),
                  ),
                )
              ],
            )));
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        isScrollControlled: true,
        context: context,
        builder: (context) => BuildHelpSheet(
              help: AppData.teamInformation[AppData.currentTeam]['help'],
            ));
  }
}

