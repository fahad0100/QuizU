import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Views/Components/CustomButton.dart';
import 'package:quizapp/Views/Components/CustomTextField.dart';
import 'package:quizapp/Controllers/03-NewUserController.dart';
import 'package:quizapp/Views/UI/01-Login/01-LoginScreen.dart';

class NewUserScreen extends StatelessWidget {
  NewUserScreen({super.key});
  final NewUserController ewUserController = Get.put(NewUserController());
  final TextEditingController? nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("QuizU App",
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome to our app",
                    style: GoogleFonts.roboto(
                        color: Colors.grey.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ),
              Text("Please give us your name",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
              child: CustomTextField(
            hintText: "Enter your name",
            controller: nameController,
          )),
          const SizedBox(
            height: 25,
          ),
          //--------Button for send new name and method call from 03-NewUserController file  --------
          Center(
            child: CustomButton(
                title: "Save",
                onPressed: () {
                  ewUserController.setName(nameUser: nameController!.text);
                }),
          )
        ],
      ),
    );
  }
}
