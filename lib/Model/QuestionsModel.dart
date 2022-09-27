class QuestionsModel {
  String? question;
  List<Map>? anser;

  String? correct;
  QuestionsModel({this.question, this.anser, this.correct});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      question: json["Question"],
      anser: [
        {
          "a": json["a"],
        },
        {
          "b": json["b"],
        },
        {"c": json["c"]},
        {"d": json["d"]},
      ],
      correct: json["correct"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Question': question,
      'anser': anser,
      'correct': correct,
    };
  }
}
