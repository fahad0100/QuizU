class UserModel {
  String? mobile;
  String? name;

  UserModel({this.mobile, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      mobile: json["mobile"],
      name: json["name"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'mobile': mobile,
      'name': name,
    };
  }
}
