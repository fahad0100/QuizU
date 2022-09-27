import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Model/UserModel.dart';
import 'package:quizapp/Server/ClassServer.dart';
import 'package:quizapp/Views/UI/04-Tabs/01-HomeScreen.dart';
import 'package:quizapp/Views/UI/04-Tabs/02-LeaderboardScreen.dart';
import 'package:quizapp/main.dart';

class StartScreenController extends GetxController {
  int selectedIndex = 0;
  List<Widget> screenWidgets = <Widget>[HomeScreen(), LeaderboardScreen()];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
