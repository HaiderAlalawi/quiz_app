class CategoryModel {
  final String? categoryTitle;
  final String? categoryImage;
  final String? categoryDescrition;
  final int? questionsNumber;
  final List<QuestionsId>? questionsId;

  CategoryModel({
    this.categoryTitle,
    this.categoryImage,
    this.categoryDescrition,
    this.questionsNumber,
    this.questionsId,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : categoryTitle = json['category_title'] as String?,
        categoryImage = json['category_image'] as String?,
        categoryDescrition = json['category_descrition'] as String?,
        questionsNumber = json['questions_number'] as int?,
        questionsId = (json['questions_id'] as List?)?.map((dynamic e) => QuestionsId.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'category_title' : categoryTitle,
    'category_image' : categoryImage,
    'category_descrition' : categoryDescrition,
    'questions_number' : questionsNumber,
    'questions_id' : questionsId?.map((e) => e.toJson()).toList()
  };
}

class QuestionsId {
  final int? questionNumber;
  final String? id;

  QuestionsId({
    this.questionNumber,
    this.id,
  });

  QuestionsId.fromJson(Map<String, dynamic> json)
      : questionNumber = json['question_number'] as int?,
        id = json['id'] as String?;

  Map<String, dynamic> toJson() => {
    'question_number' : questionNumber,
    'id' : id
  };
}