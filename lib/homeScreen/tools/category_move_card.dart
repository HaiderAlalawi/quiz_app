import 'package:carousel_slider/carousel_slider.dart';
import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:computiqquizapp/core/Responsive/responsive_screen.dart';
import 'package:flutter/material.dart';

import '../../app_tools/data.dart';

class CategoryMoveCard extends StatelessWidget {
  const CategoryMoveCard({
    Key? key,
    required ResponsiveScreenApp sizeResponsove,
    required this.data,
  }) : _sizeResponsove = sizeResponsove, super(key: key);

  final ResponsiveScreenApp _sizeResponsove;
  final Future<List<CategoryJson>> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 16),
      child: SizedBox(
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
                              child: Image.network(
                                AppData.baseUrl+snapshot.data[index].categoryImage,
                                errorBuilder: (context, url, error) => const Icon(Icons.error),
                                height: _sizeResponsove.imageCategory,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),

                            const Spacer(),
                            SizedBox(
                                width: double.infinity,
                                child: Text(
                                  snapshot.data[index].categoryTitle,
                                  style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: _sizeResponsove.textResponsiveApp - 8),
                                  textAlign: TextAlign.start,
                                )),
                            SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "${snapshot.data[index].questionsNumber} Questions" ,
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
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            }),
      ),
    );
  }
}
