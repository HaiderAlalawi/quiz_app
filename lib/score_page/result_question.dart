import 'package:computiqquizapp/app_tools/data.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/Responsive/responsive_screen.dart';
import '../homeScreen/tools/appbar/logo_image.dart';
import '../homeScreen/tools/appbar/logout_button.dart';

class ResultQuestion extends StatefulWidget {
  const ResultQuestion({Key? key}) : super(key: key);

  @override
  State<ResultQuestion> createState() => _ResultQuestionState();
}

class _ResultQuestionState extends State<ResultQuestion> {
  late final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  final List<Color> colorsUse = [
    Colors.blue,
    Colors.red,
    Colors.greenAccent,
    Colors.orange,
    Colors.brown
  ];

  Color getRandomColor(int index) {
    return colorsUse[index % colorsUse.length];
  }

  List result = AppData.teamInformation;
  int maxPoint = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    // Sort And Get Max point
    int ageCompare(u1, u2) => u2['points'] - u1['points'];
    result.sort(ageCompare);
    maxPoint = result.first['points'];




  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ResponsiveScreenApp _sizeResponsove = ResponsiveScreenApp(context, queryData);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: LogoImage(sizeResponsove: _sizeResponsove),
      ),
      body: Center(
        child: GridView.builder(
          itemCount: result.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DashedCircularProgressBar(
                valueNotifier: _valueNotifier,
                progress:double.parse(result[index]['points'].toString()),
                maxProgress: maxPoint.toDouble(),
                corners: StrokeCap.butt,
                foregroundColor: getRandomColor(index),
                backgroundColor: const Color(0xffeeeeee),
                foregroundStrokeWidth: 36,
                backgroundStrokeWidth: 36,
                animation: true,
                width: MediaQuery.of(context).size.width / 1.5 ,
                height: 200,
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _valueNotifier,
                    builder: (_, double value, __) {
                      return Text(
                        '${result[index]['teamNumber']}\n ${result[index]['points']} Point',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
              ),
            );

          },
        ),
      ),
    );
  }
}
