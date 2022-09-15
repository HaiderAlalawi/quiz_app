
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultQuestion extends StatefulWidget {

  const ResultQuestion({Key? key}) : super(key: key);

  @override
  State<ResultQuestion> createState() => _ResultQuestionState();
}

class _ResultQuestionState extends State<ResultQuestion> {

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "images/image.png",
          width: 100,
          height: 100,
        ),
      ),

      body: Center(
        child : Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceBetween,
          spacing: 30,
          direction: Axis.horizontal,
          children: [
            DashedCircularProgressBar(
              valueNotifier: _valueNotifier,
              progress: 478,
              maxProgress: 670,
              corners: StrokeCap.butt,
              foregroundColor: Colors.blue,
              backgroundColor: const Color(0xffeeeeee),
              foregroundStrokeWidth: 36,
              backgroundStrokeWidth: 36,
              animation: true,
              width: MediaQuery.of(context).size.width / 2 - 20  ,
              height: 200,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, double value, __) => Text(
                    'Team One \n 233 Point',style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            DashedCircularProgressBar(
              valueNotifier: _valueNotifier,
              progress: 500,
              maxProgress: 670,
              corners: StrokeCap.butt,
              foregroundColor: Colors.red,
              backgroundColor: const Color(0xffeeeeee),
              foregroundStrokeWidth: 36,
              backgroundStrokeWidth: 36,
              animation: true,
              width: MediaQuery.of(context).size.width / 2 - 20  ,
              height: 200,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, double value, __) => Text(
                    'Team Two \n 500 Point',style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            DashedCircularProgressBar(
              valueNotifier: _valueNotifier,
              progress: 600,
              maxProgress: 670,
              corners: StrokeCap.butt,
              foregroundColor: Colors.green,
              backgroundColor: const Color(0xffeeeeee),
              foregroundStrokeWidth: 36,
              backgroundStrokeWidth: 36,
              animation: true,
              width: MediaQuery.of(context).size.width / 2 - 20   ,
              height: 200,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, double value, __) => Text(
                    'Team Three \n 600 Point', style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
