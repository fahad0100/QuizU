import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Views/Components/CustomButton.dart';
import 'package:quizapp/Views/Components/CustomTextField.dart';
import 'package:quizapp/Controllers/07-ProfileController.dart';
import 'package:quizapp/Views/UI/01-Login/01-LoginScreen.dart';
import 'package:quizapp/Views/UI/04-Tabs/02-LeaderboardScreen.dart';
import 'package:quizapp/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await storage?.deleteAll();
                  Get.offAll(() => LoginScreen());
                } catch (error) {}
              },
              icon: Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ],
              ))
        ],
      ),
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return ListView(children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[4],
                      color: Colors.white,
                      border: Border.all(color: Colors.orange, width: 5),
                      shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageWidget(
                        imagePath: "assets/Images/score.png",
                        size: 50,
                      ),
                      Text(controller.scoreUser.toString(),
                          style: GoogleFonts.roboto(
                              color: Colors.amber[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: CustomTextField(
                    hintText: "Enter your email",
                    label: "Name",
                    controller: controller.controllerName,
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: CustomTextField(
                    hintText: "Enter your Phone",
                    label: "Phone",
                    controller: controller.controllerPhone,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: CustomButton(
                  title: "Save",
                  color: Colors.amber[900],
                  onPressed: () async {
                    if (controller.controllerName!.text.isNotEmpty &&
                        controller.controllerPhone!.text.isNotEmpty) {
                      controller.setName(
                          nameUser: controller.controllerName!.text,
                          mobile: controller.controllerPhone!.text);
                    } else {
                      Get.snackbar("Wrong", "Fields do not have to be empty",
                          colorText: Colors.red);
                    }
                  },
                ),
              )
            ]);
          }),
    );
  }
}
