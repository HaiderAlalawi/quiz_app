import 'dart:async';

import 'package:computiqquizapp/category_page/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_tools/app_theme.dart';


class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  void startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      teamName(
                        name: "Team One ",
                      ),
                      questionText(
                        name:
                            "ejowiosjeigjiaejfiqw qwjhfuiq 83 892r 83yr 83u r8y8 ",
                      ),
                      options(text: "Options 1"),
                      options(text: "Options 2"),
                      options(text: "Options 3"),
                      options(text: "Options 4"),
                      Center(
                        child: Column(children: [
                          const SizedBox(
                            height: 13,
                          ),
                          buildTimer(),
                          const SizedBox(
                            height: 30,
                          ),
                          buildButtons(),
                          const SizedBox(
                            height: 134,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 65,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button(
                    text: "Help",
                    color: AppTheme.yellow,
                    onPress: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15))),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => buldSheet());
                    },
                  ),
                  button(
                      text: "Next",
                      color: AppTheme.mainColor,
                      onPress: () => Get.to(CategoryPage(teamInformation: {},))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    return ButtonWidget(
        text: "Start Timer",
        onClcked: () {
          startTime();
        });
  }

  Widget buildTimer() => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: seconds / 1,
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation(Color(0xFFF44848)),
            ),
            CircularProgressIndicator(
              value: seconds / maxSeconds,
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
      "$seconds",
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

class buldSheet extends StatelessWidget {
  const buldSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      builder: (_, controller) => Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 25,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buldSheetContainer(
                    text: "text",
                    onPress: () => Get.to(QuestionsPage()),
                  ),
                  buldSheetContainer(
                    text: "text",
                    onPress: () => print("1"),
                  ),
                  buldSheetContainer(
                    text: "text",
                    onPress: () => print("1"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class buldSheetContainer extends StatelessWidget {
  const buldSheetContainer({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);
  final String text;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7, right: 20, left: 20),
      child: Container(
        height: 60,
        width: 156,
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.borderColor, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: TextButton(
          onPressed: () {
            onPress();
          },
          style: TextButton.styleFrom(
            primary: AppTheme.textColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.play_arrow_rounded,
                  color: AppTheme.mainColor,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
        width: 12324,
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
