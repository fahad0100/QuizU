import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Controllers/04-StartScreenController.dart';
import 'package:quizapp/Views/UI/03-StartScreen.dart/02-BottomNavigationBar.dart';
import 'package:quizapp/Views/UI/05-Profile/01-ProfileScreen.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartScreenController>(
        init: StartScreenController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                leading: controller.selectedIndex == 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: kElevationToShadow[2]),
                          child: IconButton(
                              onPressed: () {
                                Get.to(() => ProfileScreen());
                              },
                              icon: Image.asset(
                                "assets/Images/man.png",
                                width: 25,
                                height: 25,
                              )),
                        ),
                      )
                    : null,
              ),
              bottomNavigationBar: bottomNavigation(
                  currentIndex: controller.selectedIndex,
                  onTap: (index) {
                    controller.selectedIndex = index;
                    controller.update();
                  }),
              body: controller.screenWidgets[controller.selectedIndex]);
        });
  }
}
