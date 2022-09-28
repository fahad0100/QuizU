import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Model/QuestionsModel.dart';
import 'package:quizapp/Server/ClassServer.dart';
import 'package:quizapp/Views/UI/03-StartScreen.dart/01-StartScreen.dart';
import 'package:quizapp/Views/UI/04-Tabs/01-HomeScreen.dart';
import 'package:quizapp/Views/UI/04-Tabs/02-LeaderboardScreen.dart';
import 'package:quizapp/main.dart';

class QuizController extends GetxController {
  List<QuestionsModel> AllQuestions = [];
  int index = 0;
  int score = 0;
  int timerTime = 0;
  Timer? timer;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    loadQuestions();
  }

  loadQuestions() async {
    restAll();
    List dataQuestion = await ServerApi.getData(endPoint: "Questions");

    try {
      for (var question in dataQuestion) {
        AllQuestions.add(QuestionsModel.fromJson(question));
      }

      timer = Timer.periodic(Duration(seconds: 1), (timer) async {
        timerTime++;

        if (timerTime == 120) {
          timer.cancel();
          await sendScore();
          showMessageQuiz(Title: "Time is End", score: score.toString());
        }
        update();
      });
      update();
    } catch (error) {
      print(error);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    restAll();
    timer!.cancel();
  }

  sendScore() async {
    try {
      var token = await storage?.read(key: "token");
      await storage!.write(key: "score", value: score.toString());
      await ServerApi.postData(
          endPoint: "Score", Token: token, data: {"score": score.toString()});
      await showMessageQuiz(Title: "Successfully", score: score.toString());
    } catch (error) {
      print(error);
    }
  }

  restAll() {
    AllQuestions = [];
    index = 0;
    score = 0;
    timerTime = 0;
    timer?.cancel();
  }

  checkAndNext({
    required String answerSelecte,
    required String answerCorrect,
  }) async {
    if (answerSelecte == answerCorrect) {
      score += 10;
    }
    if (index < AllQuestions.length - 1) {
      index++;
    } else {
      timer?.cancel();
      await sendScore();
    }

    update();
  }
}

//"Successfully"
showMessageQuiz({required String Title, required String score}) =>
    Get.defaultDialog(
        title: Title,
        titleStyle: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 26,
            shadows: [BoxShadow(color: Colors.white, offset: Offset(1, 1))]),
        backgroundColor: Colors.green[300],
        barrierDismissible: false,
        content: Text("Scores: ${score}",
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        confirm: TextButton(
            onPressed: () {
              Get.offAll(() => StartScreen());
            },
            child: Text("Ok",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 26,
                    shadows: [
                      BoxShadow(color: Colors.white, offset: Offset(1, 1))
                    ],
                    fontWeight: FontWeight.bold))));
