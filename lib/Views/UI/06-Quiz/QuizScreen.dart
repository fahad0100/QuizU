import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Controllers/05-QuizController.dart';
import 'package:quizapp/Views/Components/QuestionWidget.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  final GlobalKey ddd = GlobalKey();
  String? anserSelect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<QuizController>(
          init: QuizController(),
          builder: (controller) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: Container(
                      // color: Colors.red,
                      height:
                          MediaQuery.of(context).size.width < 600 ? 100 : 80,
                      width: MediaQuery.of(context).size.width < 600 ? 100 : 80,
                      child: Stack(
                        children: [
                          Center(child: Text("${controller.timerTime}/120")),
                          SizedBox(
                            height: MediaQuery.of(context).size.width < 600
                                ? 100
                                : 80,
                            width: MediaQuery.of(context).size.width < 600
                                ? 100
                                : 80,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              color: Colors.green,
                              value: controller.timerTime / 120,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                controller.AllQuestions.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                            child: Text(
                          "Wait ...",
                          style: GoogleFonts.roboto(
                              color: Colors.amber[900],
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )))
                    : Column(
                        children: [
                          QuestionWidget(
                            numberOFQuestion: controller.index + 1,
                            questionData:
                                controller.AllQuestions[controller.index],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height < 600
                                ? 50
                                : 25,
                          ),
                        ],
                      )
              ],
            );
          }),
    );
  }
}
