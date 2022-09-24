import 'dart:async';

import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:computiqquizapp/app_tools/data_from_json/question_json.dart';
import 'package:computiqquizapp/questions_page/questions_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../category_page/category.dart';
import '../homeScreen/home_screen.dart';
import '../login_screen/LoginScreen.dart';

class Services {
  static Dio dio = Dio();
  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QifQ.yp7Y7D-c1Fi-8SIRUB_6uqqiah2338e4X5F6f-z23gQ';

  static signIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (usernameControl.text.isNotEmpty || passwordControl.text.isNotEmpty) {
      try {
        var response = await dio.post(
            '${AppData.baseUrl}/signin?username=${usernameControl.text}&password=${passwordControl.text}');
        if (response.statusCode == 200) {
          await prefs.setString('token', response.data['token']);
          usernameControl.clear();
          passwordControl.clear();
          Get.offAll(const HomePage());
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          Get.snackbar('', '',
              titleText: const Text('ERROR',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              messageText: const Text('Password incorrect',
                  style: TextStyle(fontSize: 16)));
        }
        if (e.response!.statusCode == 404) {
          Get.snackbar('', '',
              titleText: const Text('ERROR',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              messageText: const Text('User is not registered',
                  style: TextStyle(fontSize: 16)));
        }
      }
    } else {
      Get.snackbar('', '',
          titleText: const Text('EMPTY',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          messageText: const Text('Fill the username and password',
              style: TextStyle(fontSize: 16)));
    }
  }

  static getQuestion(String questionId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('token');
    dio.options.headers['authorization'] = 'Bearer $userToken';
    var response =
        await dio.get('${AppData.baseUrl}/get_one_question/$questionId');
    AppData.questionData = Question.fromJson(response.data);
    Get.offAll(const QuestionsPage());
  }

  static getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('token');
    dio.options.headers['authorization'] = 'Bearer $userToken';
    var response = await dio.get('${AppData.baseUrl}/get_all_categories');
    response.data.forEach((e) {
      AppData.categoryData.add(CategoryJson.fromJson(e));
    });
    Get.offAll(const CategoryPage());
  }

  static logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    AppData.categoryData.clear();

    Get.offAll(const LoginPage());
  }

  static nextButton() {
    if (AppData.currentTeam < AppData.teamInformation.length - 1) {
      AppData.currentTeam++;
    } else {
      AppData.currentTeam = 0;
    }
    stopTime();
    Get.to(const CategoryPage());
  }



  static Timer? timer;
  static void startTime() {
    AppData.seconds=AppData.questionData.seconds.obs;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (AppData.seconds > 0) {
        AppData.seconds--;
      } else {
        stopTime();
      }
    });
  }

  static void stopTime(){
    timer?.cancel();
  }

  static helpRemoveTwoAnswers(){
    return print('helpRemoveTwoAnswers');
  }

  static void helpAudienceSolve(){
    return print('helpAudienceSolve');

  }

  static void helpRandomQuestion(){
    return print('helpRandomQuestion');

  }

}
