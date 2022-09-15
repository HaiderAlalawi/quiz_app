import 'package:dio/dio.dart';

class Services{
 static Dio dio = Dio();
 static String token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QifQ.yp7Y7D-c1Fi-8SIRUB_6uqqiah2338e4X5F6f-z23gQ';


 static signIn() async {
  String userNameTextField='test';
  String passwordTextField='test';
  var response = await dio.post('https://computiqquizapp.herokuapp.com/computiq/quiz_app/signin?username=$userNameTextField&password=$passwordTextField');
  print(response.data);
  print(response.data['token']);
}

  static getQuestion() async {
    dio.options.headers['authorization']= 'Bearer $token';
    String questionId='f8517441-0941-45b1-83b2-1701b69aee7a';

    var response = await dio.get('https://computiqquizapp.herokuapp.com/computiq/quiz_app/get_one_question/$questionId');
    print(response.data);
    print(response.data['title']);
    print(response.data['answers']);
  }

  static getCategory() async {
    dio.options.headers['authorization'] = 'Bearer $token';
    var response = await dio.get('https://computiqquizapp.herokuapp.com/computiq/quiz_app/get_all_categories');
    print(response);
    print(response.data[0]);
    print(response.data[0]['category_title']);
  }

}
