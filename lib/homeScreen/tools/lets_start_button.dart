import 'package:computiqquizapp/category_page/category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_tools/services.dart';

class LetsStartButton extends StatelessWidget {
  const LetsStartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side:
        const BorderSide(color: Colors.blueAccent, width: 2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      onPressed: () async {
       await Services.getCategory();
       Get.offAll(const CategoryPage());
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Text("Let's Start",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
