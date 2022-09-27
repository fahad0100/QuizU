import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Views/Components/CustomButton.dart';
import 'package:quizapp/Views/UI/04-Tabs/02-LeaderboardScreen.dart';
import 'package:quizapp/Views/UI/06-Quiz/QuizScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          ImageWidget(
            imagePath: "assets/Images/start.png",
            size: MediaQuery.of(context).size.height < 500 ? 100 : 200,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height < 500 ? 5 : 100,
          ),
          Center(
            child: Text(
              "Let's start Quiz",
              style: GoogleFonts.roboto(
                  color: Colors.amber[800],
                  fontSize: 30,
                  shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(1, 1))
                  ],
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height < 500 ? 5 : 20,
          ),
          Center(
            child: CustomButton(
              title: "Start Quiz",
              color: Colors.amber[900],
              onPressed: () async {
                Get.to(() => QuizScreen());
              },
            ),
          )
        ]),
      ),
    );
  }
}
