import 'dart:convert';

List<CategoryJson> fromJson(String str) => List<CategoryJson>.from(json.decode(str).map((x) => CategoryJson.fromJson(x)));

String toJson(List<CategoryJson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryJson {
  CategoryJson({
    required this.categoryTitle,
    required this.categoryImage,
    required this.categoryDescrition,
    required this.questionsNumber,
    required this.questionsId,
  });

  String categoryTitle;
  String categoryImage;
  String categoryDescrition;
  int questionsNumber;
  List<QuestionsId> questionsId;

  factory CategoryJson.fromJson(Map<String, dynamic> json) => CategoryJson(
    categoryTitle: json["category_title"],
    categoryImage: json["category_image"],
    categoryDescrition: json["category_descrition"],
    questionsNumber: json["questions_number"],
    questionsId: List<QuestionsId>.from(json["questions_id"].map((x) => QuestionsId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_title": categoryTitle,
    "category_image": categoryImage,
    "category_descrition": categoryDescrition,
    "questions_number": questionsNumber,
    "questions_id": List<dynamic>.from(questionsId.map((x) => x.toJson())),
  };
}

class QuestionsId {
  QuestionsId({
    required this.questionNumber,
    required this.id,
  });

  int questionNumber;
  String id;

  factory QuestionsId.fromJson(Map<String, dynamic> json) => QuestionsId(
    questionNumber: json["question_number"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "question_number": questionNumber,
    "id": id,
  };
}
