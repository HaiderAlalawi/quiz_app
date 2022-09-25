import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:computiqquizapp/app_tools/services.dart';
import 'package:flutter/material.dart';
import '../../app_tools/bottom_sheet_container.dart';

class BuildCategorySheet extends StatelessWidget {

   const BuildCategorySheet({
    Key? key, required this.question,
  }) :super(key: key);

   final List<QuestionsId> question;

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
                children: question.map((e) => BuildSheetContainer(text: e.questionNumber.toString(),
                    pressed: (){Services.getQuestion(e.id);})).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}