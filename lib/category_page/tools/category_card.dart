import 'package:computiqquizapp/app_tools/data.dart';
import 'package:flutter/material.dart';
import '../../app_tools/app_theme.dart';
import 'build_category_sheet.dart';
import '../../app_tools/data_from_json/category_json.dart';
import 'category_card_text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.questionsNumber, required this.categoryQuestions,
  }) : super(key: key);
  final String image;
  final String name;
  final String description;
  final String questionsNumber;
  final List<QuestionsId> categoryQuestions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            isScrollControlled: true,
            context: context,
            builder: (context) => BuildCategorySheet(question: categoryQuestions, categoryName: name,));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        width: 305,
        //color: AppTheme.gray,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.8,
              child: SizedBox(
                width: 305,
                height: 100,
                child: Image.network(
                AppData.baseUrl+image,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CategoryCardText(title: name, size: 20, weight: FontWeight.bold),
            CategoryCardText(title: '$questionsNumber Question', size: 14, weight: FontWeight.bold,color:AppTheme.gray2 ),
            CategoryCardText(title: description, size: 14, weight: FontWeight.w500,align:TextAlign.justify),
          ],
        ),
      ),
    );
  }
}

