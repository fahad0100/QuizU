class TopUserModel {
  String? name;
  int? score;
  TopUserModel({this.name, this.score});

  factory TopUserModel.fromJson(Map<String, dynamic> json) {
    return TopUserModel(
      name: json["name"],
      score: json["score"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
    };
  }
}
