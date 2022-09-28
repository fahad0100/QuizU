import 'package:get/get.dart';
import 'package:quizapp/Views/Components/loadingWidgets.dart';
import 'package:quizapp/Model/TopUserModel.dart';
import 'package:quizapp/Model/UserModel.dart';
import 'package:quizapp/Server/ClassServer.dart';
import 'package:quizapp/Views/UI/01-Login/02-OtpScreen.dart';
import 'package:quizapp/Views/UI/03-StartScreen.dart/01-StartScreen.dart';
import 'package:quizapp/main.dart';

class LeaderboardController extends GetxController {
  UserModel? userInfo;
  @override
  void onInit() {
    super.onInit();
    getInfoUser();
    loadTopScores();
  }

  Future<List<TopUserModel>?>? loadTopScores() async {
    List<TopUserModel> dataTopUsers = [];

    List? topUsersLoad = await ServerApi.getData(endPoint: "TopScores");

    for (var userScore in topUsersLoad!) {
      dataTopUsers.add(TopUserModel.fromJson(userScore));
    }

    return dataTopUsers;
  }

  getInfoUser() async {
    try {
      var getInfo = await ServerApi.getData(endPoint: "UserInfo");

      userInfo = UserModel.fromJson(getInfo);
      update();
    } catch (error) {
      print(error);
    }
  }
}
