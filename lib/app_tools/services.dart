import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:computiqquizapp/app_tools/data_from_json/question_json.dart';
import 'package:computiqquizapp/questions_page/questions_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../category_page/category.dart';
import '../homeScreen/home_screen.dart';
import '../login_screen/LoginScreen.dart';

class Services {
 static Dio dio = Dio();
 static String token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QifQ.yp7Y7D-c1Fi-8SIRUB_6uqqiah2338e4X5F6f-z23gQ';

 static signIn() async {
   final prefs = await SharedPreferences.getInstance();
   try {
     var response = await dio.post(
         '${AppData.baseUrl}/signin?username=${usernameControl
             .text}&password=${passwordControl.text}');
     await prefs.setString('token', response.data['token']);
     Get.offAll(const HomePage());
   }
   catch(e){
     print(e);
   }
}

  static getQuestion(String questionId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('token');
    dio.options.headers['authorization']= 'Bearer $userToken';
    var response = await dio.get('${AppData.baseUrl}/get_one_question/$questionId');
    AppData.questionData = Question.fromJson(response.data);
    Get.offAll(QuestionsPage());
  }

  static getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('token');
    dio.options.headers['authorization'] = 'Bearer $userToken';
    var response = await dio.get('${AppData.baseUrl}/get_all_categories');
    response.data.forEach((e) {
      AppData.categoryData.add(CategoryJson.fromJson(e));
    });
    Get.to(const CategoryPage());
  }

}


