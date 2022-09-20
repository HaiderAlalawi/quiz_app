// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

Question welcomeFromJson(String str) => Question.fromJson(json.decode(str));

String welcomeToJson(Question data) => json.encode(data.toJson());

class Question {
  Question({
    required this.title,
    required this.category,
    required this.points,
    required this.seconds,
    required this.answers,
  });

  String title;
  String category;
  int points;
  int seconds;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    title: json["title"],
    category: json["category"],
    points: json["points"],
    seconds: json["seconds"],
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "category": category,
    "points": points,
    "seconds": seconds,
    "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
  };
}

class Answer {
  Answer({
    required this.title,
    required this.isTrue,
  });

  String title;
  bool isTrue;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    title: json["title"],
    isTrue: json["isTrue"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "isTrue": isTrue,
  };
}



