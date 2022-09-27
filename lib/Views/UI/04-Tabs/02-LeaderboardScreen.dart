import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Controllers/06-LeaderboardController.dart';
import 'package:quizapp/Model/TopUserModel.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<LeaderboardController>(
          init: LeaderboardController(),
          builder: (controller) {
            return ListView(
              children: [
                const ImageWidget(
                  imagePath: "assets/Images/score.png",
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Top Scores",
                          style: GoogleFonts.roboto(
                              color: Colors.amber[800],
                              fontSize: 20,
                              shadows: [
                                const Shadow(
                                    color: Colors.red, offset: Offset(1, 0))
                              ])),
                      Divider(
                        color: Colors.amber[800],
                      )
                    ],
                  ),
                ),
                FutureBuilder(
                    future: controller.loadTopScores(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<TopUserModel>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Colors.amber[900],
                        ));
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: Text(
                            "No data found ):",
                            style: GoogleFonts.roboto(
                                color: Colors.amber[800],
                                fontSize: 30,
                                shadows: [
                                  Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(1, 1))
                                ],
                                fontWeight: FontWeight.normal),
                          ),
                        );
                      } else {
                        return ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            reverse: false,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    index < 3
                                        ? const Expanded(
                                            flex: 1,
                                            child: ImageWidget(
                                              imagePath:
                                                  "assets/Images/score.png",
                                              size: 30,
                                            ),
                                          )
                                        : const Expanded(
                                            flex: 1, child: Text("")),
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          snapshot.data![index].name.toString(),
                                          style: GoogleFonts.roboto(
                                              color: controller
                                                          .userInfo?.name ==
                                                      snapshot.data![index].name
                                                          .toString()
                                                  ? Colors.black
                                                  : Colors.amber[900],
                                              fontSize: controller
                                                          .userInfo?.name ==
                                                      snapshot.data![index].name
                                                          .toString()
                                                  ? 14
                                                  : index < 3
                                                      ? 12
                                                      : 12,
                                              fontWeight: controller
                                                          .userInfo?.name ==
                                                      snapshot.data![index].name
                                                          .toString()
                                                  ? FontWeight.bold
                                                  : index < 3
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          snapshot.data![index].score
                                              .toString(),
                                          style: GoogleFonts.roboto(
                                              color: Colors.amber[800],
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              );
                            }),
                            separatorBuilder: ((context, index) =>
                                const Text("")),
                            itemCount: snapshot.data!.length);
                      }
                    }),
              ],
            );
          }),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.imagePath, required this.size});
  final String imagePath;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
      ),
    );
  }
}
