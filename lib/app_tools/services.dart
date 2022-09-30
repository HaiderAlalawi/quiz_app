import 'dart:async';
import 'dart:math';
import 'package:computiqquizapp/app_tools/app_theme.dart';
import 'package:computiqquizapp/app_tools/data.dart';
import 'package:computiqquizapp/app_tools/data_from_json/category_json.dart';
import 'package:computiqquizapp/app_tools/data_from_json/question_json.dart';
import 'package:computiqquizapp/questions_page/questions_page.dart';
import 'package:computiqquizapp/score_page/result_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../category_page/category_page.dart';
import '../homeScreen/home_screen.dart';
import '../login_screen/LoginScreen.dart';

class Services {
  static Dio dio = Dio();
  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QifQ.yp7Y7D-c1Fi-8SIRUB_6uqqiah2338e4X5F6f-z23gQ';

  static signIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (usernameControl.text.isNotEmpty && passwordControl.text.isNotEmpty) {
      try {
        var response = await dio.post(
            '${AppData.baseUrl}/computiq/quiz_app/signin?username=${usernameControl.text}&password=${passwordControl.text}');
        if (response.statusCode == 200) {
          await prefs.setString('token', response.data['token']);
          usernameControl.clear();
          passwordControl.clear();
          Get.offAll(const HomePage());
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          mySnackBar(
              title: 'ERROR',
              titleColor: Colors.red,
              message: 'Password incorrect');
        }
        if (e.response!.statusCode == 404) {
          mySnackBar(
            title: 'ERROR',
            titleColor: Colors.red,
            message: 'User is not registered',
          );
        }
      }
    } else {
      mySnackBar(
        title: 'EMPTY',
        titleColor: Colors.red,
        message: 'Fill the username and password',
      );
    }
  }

  static getQuestion(String questionId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('token');
    AppData.questionId=questionId;
    dio.options.headers['authorization'] = 'Bearer $userToken';
    var response = await dio.get(
        '${AppData.baseUrl}/computiq/quiz_app/get_one_question/$questionId');
    AppData.questionData = Question.fromJson(response.data);
  }

  static getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('token');
    dio.options.headers['authorization'] = 'Bearer $userToken';
    var response = await dio
        .get('${AppData.baseUrl}/computiq/quiz_app/get_all_categories');
    response.data.forEach((e) {
      AppData.categoryData.add(CategoryJson.fromJson(e));
    });
    for (var e in AppData.categoryData) {
      AppData.questionsNumber+= e.questionsNumber;
    }
  }

  static Future<List<CategoryJson>> getProductList() async {
    List<CategoryJson> list = [];
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('token');
    dio.options.headers['authorization'] = 'Bearer $userToken';
    var response = await dio
        .get('${AppData.baseUrl}/computiq/quiz_app/get_all_categories');
    if (response.statusCode == 200 && response.data != null) {
      response.data.forEach((e) {
        list.add(CategoryJson.fromJson(e));
      });
    } else {
      return [];
    }
    return list;
  }

  static logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    AppData.categoryData.clear();
    Get.offAll(const LoginPage());
  }

  static nextButton() {
    if (AppData.seconds.value == 0) {
      print(AppData.teamInformation.length);
      print(AppData.questionsNumber);

      if (AppData.teamInformation.length > AppData.questionsNumber &&
          AppData.currentTeam == (AppData.teamInformation.length - 1)) {
        mySnackBar(title: 'Sorry',
            titleColor: AppTheme.red,
            message: 'There is not enough question to all team, please end the session.');
      } else {
        if (AppData.currentTeam < AppData.teamInformation.length - 1) {
          AppData.currentTeam++;
        } else {
          AppData.currentTeam = 0;
        }
        removeQuestion();
        stopTime();
        Get.offAll(const CategoryPage());
      }
    }
  }

  static letsStart() async{
    await Services.getCategory();

    if(AppData.teamInformation.length > AppData.questionsNumber){
      mySnackBar(title: 'Sorry', titleColor: AppTheme.red, message: 'There is not enough question to all team it just ${AppData.questionsNumber} questions, please decrease number of team.');
      AppData.questionsNumber=0;
      AppData.categoryData.clear();
    }else{
      Get.offAll(const CategoryPage());
    }
  }

  static Timer? timer;

  static void startTime() {
    AppData.seconds = AppData.questionData.seconds.obs;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (AppData.seconds > 0) {
        AppData.seconds--;
      } else {
        stopTime();
      }
    });
  }

  static void stopTime() {
    timer?.cancel();
  }

  static decreaseTeam() {
    if (AppData.teamInformation.length > 1) {
      AppData.teamInformation.removeLast();
    }
  }

  static increaseTeam() {
    AppData.teamInformation
        .add({'teamNumber': AppData.teamInformation.length + 1, 'points': 0,'help':[
      {'buttonName':'Remove two answers',
        'pressed':  () {Services.helpRemoveTwoAnswers();}
      },
      {'buttonName':'Audience answer',
        'pressed': () {Services.helpAudienceSolve();}
      },
      {'buttonName':'Random question',
        'pressed': () {Services.helpRandomQuestion();}
      },

    ]});
  }

  static void helpRemoveTwoAnswers() {
    if (AppData.seconds.value != 0) {
      int length = AppData.questionData.answers.length;
      for (int time = 0; length != 2; time++) {
        int index = Random().nextInt(length);
        if (!AppData.questionData.answers[index].isTrue) {
          AppData.questionData.answers.removeAt(index);
          length--;
        }
      }
      Get.back();
      AppData.teamInformation[AppData.currentTeam]['help'].removeWhere((e) => e['buttonName']== 'Remove two answers');
    }
  }

  static void helpAudienceSolve() {
    if (AppData.seconds.value != 0) {
      AppData.seconds.value += 60;
      AppData.questionData.seconds = AppData.seconds.value;
    }
    Get.back();
    AppData.teamInformation[AppData.currentTeam]['help'].removeWhere((e) => e['buttonName']== 'Audience answer');
  }

  static void helpRandomQuestion() async{
    if (AppData.seconds.value != 0) {
      stopTime();
      Get.back();
      AppData.teamInformation[AppData.currentTeam]['help'].removeWhere((e) => e['buttonName']== 'Random question');
      int randomCategory = Random().nextInt(AppData.categoryData.length);
      await getQuestion(
          AppData.categoryData[randomCategory].questionsId[Random().nextInt(
              AppData.categoryData[randomCategory].questionsId.length)].id);
      openQuestion(questionId: AppData.questionId);
    }
  }

  static void lockAnswer(bool correct, int point) {
    if (AppData.seconds.value == 0) {
      null;
    } else {
      AppData.seconds.value = 0;
      if (correct) {
        AppData.teamInformation[AppData.currentTeam]['points'] += point;
        mySnackBar(
            title: 'Great',
            titleColor: Colors.green,
            message:
                '${point.toString()} points added to team ${AppData.teamInformation[AppData.currentTeam]['teamNumber']}');
      }
    }
  }

  static void removeQuestion() {
    for (var e in AppData.categoryData) {
        e.questionsId.removeWhere((e) => e.id == AppData.questionId);
        e.questionsNumber=e.questionsId.length;
    }
    AppData.questionsNumber-=1;
    AppData.categoryData.removeWhere((e) => e.questionsId.isEmpty);
  }

  static void openQuestion({required String questionId}) async {
   await Services.getQuestion(questionId);
    Get.offAll(const QuestionsPage());
  }

  static void endQuiz() {
    if (AppData.seconds.value == 0) {
      Get.offAll(const ResultPage());
    }
  }

  static void backToHome() {
    AppData.categoryData.clear();
    AppData.currentTeam = 0;
    AppData.questionsNumber=0;
    AppData.teamInformation = [
      {'teamNumber':1,'points': 0,'help':[
        {'buttonName':'Remove two answers',
          'pressed':  () {Services.helpRemoveTwoAnswers();}
        },
        {'buttonName':'Audience answer',
          'pressed': () {Services.helpAudienceSolve();}
        },
        {'buttonName':'Random question',
          'pressed': () {Services.helpRandomQuestion();}
        },
      ]}
    ].obs;
    Get.offAll(const HomePage());
  }

  static SnackbarController mySnackBar(
      {required String title,
      required Color titleColor,
      required String message}) {
    return Get.snackbar('', '',
        titleText: Text(title,
            style: TextStyle(
                color: titleColor, fontSize: 18, fontWeight: FontWeight.bold)),
        messageText: Text(message, style: const TextStyle(fontSize: 16)));
  }
}
