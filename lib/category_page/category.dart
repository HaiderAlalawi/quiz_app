import 'package:computiqquizapp/app_tools/data.dart';
import 'package:flutter/material.dart';
import '../app_tools/app_theme.dart';
import '../questions_page/questions_page.dart';

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
                name: "Team 1 ",
              ),
              Expanded(
                child: ListView(
                  children: AppData.categoryData.map(
                    (e) => categoryCard(
                  image: e.categoryImage,
                  name: e.categoryTitle,
                  questiones: e.questionsNumber.toString(),
                  description:e.categoryDescrition),
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

class categoryCard extends StatelessWidget {
  const categoryCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.questiones,
  }) : super(key: key);
  final String image;
  final String name;
  final String description;
  final String questiones;

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
            builder: (context) => buldSheet());
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
                child: Image.asset(
                  fit: BoxFit.fitWidth,
                  'image',
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
              questiones,
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
