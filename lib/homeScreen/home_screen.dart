import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:computiqquizapp/category_page/category.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/Responsive/responsive_screen.dart';
import 'models/CategoryModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 1;
  late Future<List<CategoryModel>> data;

  Map<String, int> teamInformation = {
    "team 1": 0,
  };

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    data =  getProductList();
  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context);
    ResponsiveScreenApp _sizeResponsove = ResponsiveScreenApp(context, queryData);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "images/image.png",
          width: _sizeResponsove.iconAppBar,
        ),

        actions: [
          IconButton(
              onPressed: () {

                // LogOut Function
              },
              icon:  Icon(Icons.logout, color: Colors.black,size: _sizeResponsove.iconApp,)

          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius:  BorderRadius.only(
                  bottomRight: Radius.circular(_sizeResponsove.radiusImageApp),
                  bottomLeft: Radius.circular(_sizeResponsove.radiusImageApp),
                ),
                child: Image.asset(
                  "images/cover.png",
                  height: _sizeResponsove.heightRadiusImageApp,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Category',
                    style: TextStyle(fontSize: _sizeResponsove.textResponsiveApp, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: _sizeResponsove.highCategory,
              child: FutureBuilder(
                future: data,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error, Check Internet");
                } else if (!snapshot.hasData) {
                  return const Text("Please Wait .....", style: TextStyle(fontWeight: FontWeight.bold),) ;
                } else {
                  return CarouselSlider.builder(

                    itemCount: snapshot.data!.length ?? 0,
                    itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),


                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'images/1.jpeg',
                                  height: _sizeResponsove.imageCategory,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),

                              Spacer(),
                              SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    snapshot.data[index].categoryTitle,
                                    style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: _sizeResponsove.textResponsiveApp),
                                    textAlign: TextAlign.start,
                                  )),
                              SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Number Of Question : " + snapshot.data[index].questionsNumber.toString(),
                                    style:  TextStyle(

                                        fontWeight: FontWeight.bold,
                                        fontSize: _sizeResponsove.textResponsiveApp - 10,
                                        color: Colors.black45),
                                    textAlign: TextAlign.start,
                                  )),
                            ],
                          ),
                        ),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16/9,
                      viewportFraction: 0.54,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                }
              }),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8.0),
              child:  SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Enter Number Of Teams',
                    style: TextStyle(fontSize: _sizeResponsove.textResponsiveApp, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).accentColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              if (number > 1) {
                                setState(() {
                                  teamInformation.remove('team $number');
                                  number--;
                                });
                                print(teamInformation);
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 25,
                            )),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white),
                          child: Text(
                            number.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                number++;
                                teamInformation['team $number'] = 0;
                              });

                              print(teamInformation);
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            )),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      side:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    onPressed: () {
                      Get.to(CategoryPage(teamInformation: teamInformation,));
                      print('Pressed');
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text("Let's Start",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Future<List<CategoryModel>> getProductList() async {
    List<CategoryModel> _list = [];
    Dio dio = Dio();
    final String token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QifQ.yp7Y7D-c1Fi-8SIRUB_6uqqiah2338e4X5F6f-z23gQ';

    dio.options.headers['authorization'] = 'Bearer $token';
    var response = await dio.get('https://computiqquizapp.herokuapp.com/computiq/quiz_app/get_all_categories');

    if (response.statusCode == 200 && response.data != null) {

      response.data.forEach((e){
        _list.add(CategoryModel.fromJson(e));
      });
    }else {
      return [];
    }

    return _list;

  }
}
