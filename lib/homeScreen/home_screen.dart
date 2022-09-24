import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/app_tools/services.dart';
import 'package:computiqquizapp/homeScreen/tools/category_move_card.dart';
import 'package:computiqquizapp/homeScreen/tools/category_text.dart';
import 'package:computiqquizapp/homeScreen/tools/image_clip.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../app_tools/data_from_json/category_json.dart';
import '../core/Responsive/responsive_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CategoryJson>> data;


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
                Services.logOut();
                // LogOut Function
              },
              icon:  Icon(Icons.logout, color: Colors.red,size: _sizeResponsove.iconApp,)

          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageClip(sizeResponsove: _sizeResponsove),
            CategoryText(sizeResponsove: _sizeResponsove, text: 'Category'),
            CategoryMoveCard(sizeResponsove: _sizeResponsove, data: data),
            CategoryText(sizeResponsove: _sizeResponsove, text: 'Enter Number Of Teams'),

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
                              if (AppData.teamInformation.length > 1) {
                                setState(() {
                                  AppData.teamInformation.removeLast();

                                });
                                print(AppData.teamInformation);
                                print(AppData.teamInformation.length);

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
                            AppData.teamInformation.length.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                AppData.teamInformation.add({'teamNumber':AppData.teamInformation.length + 1,'points': 0}
                                    );
                              });
                              print(AppData.teamInformation);
                              print(AppData.teamInformation.length);
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
                      Services.getCategory();
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

  Future<List<CategoryJson>> getProductList() async {
    List<CategoryJson> _list = [];
    Dio dio = Dio();
    final String token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QifQ.yp7Y7D-c1Fi-8SIRUB_6uqqiah2338e4X5F6f-z23gQ';

    dio.options.headers['authorization'] = 'Bearer $token';
    var response = await dio.get('https://computiqquizapp.herokuapp.com/computiq/quiz_app/get_all_categories');

    if (response.statusCode == 200 && response.data != null) {

      response.data.forEach((e){
        _list.add(CategoryJson.fromJson(e));
      });
    }else {
      return [];
    }

    return _list;

  }
}

