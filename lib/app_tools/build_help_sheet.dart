import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:computiqquizapp/app_tools/data_from_json/question_json.dart';
import 'package:get/get.dart';
import 'package:computiqquizapp/app_tools/services.dart';
import 'package:flutter/material.dart';
import '../questions_page/questions_page.dart';
import 'build_sheet_container.dart';

class BuildHelpSheet extends StatelessWidget {

   const BuildHelpSheet({
    Key? key, required this.help,
  }) :super(key: key);

   final List help;

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
                children: help.map((e) => BuildSheetContainer(text: e['buttonName'],
                    pressed: e['pressed'])).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}