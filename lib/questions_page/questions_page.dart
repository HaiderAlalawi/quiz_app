import 'dart:async';

import 'package:computiqquizapp/app_tools/services.dart';
import 'package:computiqquizapp/category_page/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_tools/app_theme.dart';
import '../app_tools/build_category_sheet.dart';
import '../app_tools/build_help_sheet.dart';
import '../app_tools/data.dart';


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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "images/image.png",
          height: 100,
          width: 100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                questionText(
                  name:
                  AppData.questionData.title,
                ),
                      SizedBox(
                      height:350,
                        child: ListView(
                          children: AppData.questionData.answers.map((e) => options(text: e.title)).toList(),
                        ),
                      ),
                Obx(() {
                    return Center(child: buildTimer());
                  }
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button(
                        text: "Help",
                        color: AppTheme.yellow,
                        onPress: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15))),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) =>  BuildHelpSheet(help: AppData.helpButton,));
                        },
                      ),
                      button(
                          text: "Next",
                          color: AppTheme.mainColor,
                          onPress: () => Services.nextButton()),
                    ]
                ),
              ),
            )

          ],
        )
    )
    );
  }


  Widget buildTimer() => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: AppData.seconds / 1,
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation(Color(0xFFF44848)),
            ),
            CircularProgressIndicator(
              value: AppData.seconds / AppData.questionData.seconds,
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation(Color(0xFF33ADF8)),
            ),
            Center(
              child: buildTime(),
            ),
          ],
        ),
      );

  Widget buildTime() {
    return Text(
      "${AppData.seconds}",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final text;
  final onClcked;
  const ButtonWidget({Key? key, required this.text, required this.onClcked})
      : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppTheme.mainColor, onPrimary: Colors.white),
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        onPressed: onClcked,
      );
}





class button extends StatelessWidget {
  const button({
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
    return Container(
      height: 56,
      width: 156,
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color,
          primary: Colors.white,
        ),
      ),
    );
  }
}

class options extends StatelessWidget {
  const options({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, bottom: 13),
      child: Container(
        height: 53,
        width: double.maxFinite,
        child: TextButton(
          onPressed: () {
            //Books.makeAsTrue(b.isSold);
            //b.isSold.value = true;
          },
          child: Text(text),
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppTheme.gray,
            primary: AppTheme.textColor,
            //padding: EdgeInsets.only(bottom: 25, top: 25),
          ),
        ),
      ),
    );
  }
}

class teamName extends StatelessWidget {
  const teamName({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        name,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 24,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          color: AppTheme.mainColor,
        ),
      ),
    );
  }
}

class questionText extends StatelessWidget {
  const questionText({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        name,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: AppTheme.textColor,
        ),
      ),
    );
  }
}
