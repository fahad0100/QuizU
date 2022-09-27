import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Controllers/05-QuizController.dart';
import 'package:quizapp/Model/QuestionsModel.dart';
import 'package:quizapp/Views/Components/AnswerWidget.dart';
import 'package:quizapp/Views/Components/loadingWidgets.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget(
      {super.key, required this.numberOFQuestion, required this.questionData});
  final int? numberOFQuestion;
  final QuestionsModel? questionData;
  late String? answerSelect = null;
  QuizController c_QuizController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 50),
              child: Text(
                "Question $numberOFQuestion",
                style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height < 600 ? 25 : 10,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  questionData!.question.toString(),
                  style: GoogleFonts.roboto(
                      color: Colors.amber[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            childAspectRatio:
                MediaQuery.of(context).size.width > 600 ? 6 / 1 : 4 / 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: questionData!.anser!.map((e) {
              return GetBuilder<QuizController>(
                init: QuizController(),
                builder: (controller) {
                  return Center(
                    child: AnswerWidget(
                      answerCode: e.keys.first.toString(),
                      answerValue: e.values.first.toString(),
                      bacgroundColor: Colors.white,
                      onTap: () async {
                        if (controller.index <
                            controller.AllQuestions.length - 1) {
                          controller.checkAndNext(
                              answerSelecte: e.keys.first.toString(),
                              answerCorrect: questionData!.correct.toString());
                        } else {
                          loadingWidgets(title: "wite");
                          controller.checkAndNext(
                              answerSelecte: e.keys.first.toString(),
                              answerCorrect: questionData!.correct.toString());
                        }
                      },
                    ),
                  );
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
