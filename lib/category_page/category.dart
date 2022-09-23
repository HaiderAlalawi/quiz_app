import 'package:flutter/material.dart';

import '../app_tools/app_theme.dart';
import '../questions_page/questions_page.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key,  required this.teamInformation}) : super(key: key);

  Map<String, int> teamInformation;



  @override
  Widget build(BuildContext context) {
    print(teamInformation);
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
                  children: [
                    categoryCard(
                        image: "images/image1.jpg",
                        name: teamInformation['team 1'].toString(),
                        questiones: "10 questiones",
                        description:
                            "data Web design is the process of planning and executing multimedia content over a network."),
                    categoryCard(
                        image: "images/image1.jpg",
                        name: "web design",
                        questiones: "10 questiones",
                        description:
                            "data Web design is the process of planning and executing multimedia content over a network."),
                    categoryCard(
                        image: "images/image1.jpg",
                        name: "web design",
                        questiones: "10 questiones",
                        description:
                            "data Web design is the process of planning and executing multimedia content over a network."),
                  ],
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            isScrollControlled: true,
            context: context,
            builder: (context) => buldSheet());
      },
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 305,
          //color: AppTheme.gray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.8,
                child: Image.asset(
                  image,
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
      ),
    );
  }
}
