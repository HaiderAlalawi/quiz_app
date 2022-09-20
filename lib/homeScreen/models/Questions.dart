class Questions {
  int? questionNumber;
  String? id;

  Questions({
      this.questionNumber, 
      this.id,});

  Questions.fromJson(dynamic json) {
    questionNumber = json['question_number'];
    id = json['id'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question_number'] = questionNumber;
    map['id'] = id;
    return map;
  }

}