import 'package:computiqquizapp/category_page/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "images/image.png",
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(200),
                  bottomLeft: Radius.circular(200),
                ),
                child: Image.asset(
                  "images/cover.png",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Category',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 250,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 210,
                    width: 190,
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
                            "images/2.jpeg",
                            height: 190,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            child: Text("Category One", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.start,)
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text("10 Question", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45),textAlign: TextAlign.start,)
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 210,
                    width: 190,
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
                            "images/1.jpeg",
                            height: 190,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            child: Text("Category One", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.start,)
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text("10 Question", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45),textAlign: TextAlign.start,)
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 210,
                    width: 190,
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
                            "images/2.jpeg",
                            height: 190,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            child: Text("Category One", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.start,)
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text("10 Question", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45),textAlign: TextAlign.start,)
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 210,
                    width: 190,
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
                            "images/2.jpeg",
                            height: 190,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                            width: double.infinity,
                            child: Text("Category One", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.start,)
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: Text("10 Question", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45),textAlign: TextAlign.start,)
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8.0),
              child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Enter Number Of Teams',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                              if (number > 0) {
                                setState(() {
                                  number--;
                                });
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
                              });
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
                      Get.to(const CategoryPage());
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
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(

                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.black12), //<-- SEE HERE
                    ),

                    hintText: 'Team 1'
                ),

              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(

                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.black12), //<-- SEE HERE
                    ),

                    hintText: 'Team 1'
                ),

              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(

                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.black12), //<-- SEE HERE
                    ),

                    hintText: 'Team 1'
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
