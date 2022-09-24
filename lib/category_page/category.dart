import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:flutter/material.dart';
import '../app_tools/app_theme.dart';
import '../app_tools/build_category_sheet.dart';
import '../questions_page/questions_page.dart';

//AppData.categoryData[0].questionsId

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              teamName(
                name: 'Team ${AppData.teamInformation[AppData.currentTeam]['teamNumber'].toString()}',
              ),
              Expanded(
                child: ListView(
                  children: AppData.categoryData.map(
                    (e) => CategoryCard(
                  image: e.categoryImage,
                  name: e.categoryTitle,
                  questionsNumber: e.questionsNumber.toString(),
                  description:e.categoryDescrition, categoryQuestions: e.questionsId,),
        ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            builder: (context) => BuildCategorySheet(question: categoryQuestions));
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
              child: Container(
                width: 305,
                height: 100,
                child: Image.network(
                  image,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              questionsNumber,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.gray2,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
