import 'package:flutter/material.dart';
import '../../app_tools/bottom_sheet_container.dart';

class BuildHelpSheet extends StatelessWidget {

    const BuildHelpSheet({
    Key? key,  required this.help,
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
                  )
            ),
          ],
        ),
      ),
    );
  }
}