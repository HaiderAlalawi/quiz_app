import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:computiqquizapp/app_tools/data_from_json/question_json.dart';
import 'package:computiqquizapp/questions_page/questions_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../category_page/category.dart';
import '../homeScreen/home_screen.dart';
import '../login_screen/LoginScreen.dart';

class Services{
 static Dio dio = Dio();
 static String token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QifQ.yp7Y7D-c1Fi-8SIRUB_6uqqiah2338e4X5F6f-z23gQ';

 static signIn() async {
   try {
     var response = await dio.post(
         '${AppData.baseUrl}/signin?username=${usernameControl
             .text}&password=${passwordControl.text}');
     print(response.data);
     print(response.data['token']);
     Get.offAll(HomePage());
   }
   catch(e){
     print(e);
   }
}

  static getQuestion(String questionId) async {
    dio.options.headers['authorization']= 'Bearer $token';
    var response = await dio.get('${AppData.baseUrl}/get_one_question/$questionId');
    AppData.questionData = Question.fromJson(response.data);
    print(AppData.questionData);
    Get.offAll(QuestionsPage());
  }

  static getCategory() async {
    dio.options.headers['authorization'] = 'Bearer $token';
    var response = await dio.get('${AppData.baseUrl}/get_all_categories');
    List data=response.data;
    AppData.categoryData.add(data.map((e) => CategoryJson(categoryTitle: e.categoryTitle, categoryImage: e.categoryImage, categoryDescrition: e.categoryDescrition, questionsNumber: e.questionsNumber, questionsId: e.questionsId)));
    print(AppData.categoryData[0].categoryTitle);
    //Get.to(const CategoryPage());
  }

}


