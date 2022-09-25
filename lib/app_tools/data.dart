import 'package:computiqquizapp/app_tools/services.dart';
import 'package:get/get.dart';
import 'package:computiqquizapp/app_tools/data_from_json/question_json.dart';
import 'data_from_json/category_json.dart';

abstract class AppData{
  static String baseUrl='https://computiqquizapp.herokuapp.com/computiq/quiz_app';
  //static String baseUrl='http://10.0.2.2:8000/computiq/quiz_app';
  static late Question questionData;
  static  List<CategoryJson> categoryData=[];
  static int currentTeam=0;
  static RxInt seconds=0.obs;
  static RxList teamInformation = [
    {'teamNumber':1,'points': 0},
  ].obs;
  static List helpButtonOptions=[
    {'buttonName':'Remove two answers',
     'pressed':  () {Services.helpRemoveTwoAnswers();}
    },
    {'buttonName':'Audience answer',
      'pressed': () {Services.helpAudienceSolve();}
    },
    {'buttonName':'Random question',
      'pressed': () {Services.helpRandomQuestion();}
    },

  ];


}
