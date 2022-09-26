import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/category_page/tools/category_card.dart';
import 'package:computiqquizapp/category_page/tools/team_name.dart';
import 'package:flutter/material.dart';

import '../app_tools/logo_image_app_bar.dart';

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
        title: const LogoImageAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TeamName(
                name:
                    'Team ${AppData.teamInformation[AppData.currentTeam]['teamNumber'].toString()}',
              ),
              Expanded(
                child: ListView(
                  children: AppData.categoryData
                      .map(
                        (e) =>  CategoryCard(
                          image: e.categoryImage,
                          name: e.categoryTitle,
                          questionsNumber: e.questionsNumber.toString(),
                          description: e.categoryDescrition,
                          categoryQuestions: e.questionsId,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

