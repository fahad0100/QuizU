import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Views/Components/TextFieldNumber.dart';
import 'package:quizapp/Model/DataCountryCode.dart';
import 'package:quizapp/Controllers/01-LoginController.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //--------variable--------
  final GlobalKey<FormState> phoneformKey = GlobalKey();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return ListView(
              children: [
                //--------image for Login--------
                Center(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 200, maxWidth: 200),
                    child: Image.asset(
                      "assets/Images/start.png",
                      width: MediaQuery.of(context).size.height / 4,
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  ),
                ),
                //--------Title for Login--------
                Center(
                  child: Text("QuizU",
                      style: GoogleFonts.roboto(
                          color: Colors.amber[900],
                          fontSize: 50,
                          fontWeight: FontWeight.bold)),
                ),
                //--------Welcome message--------
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                        "In this application you will be happy with answer a lot of questions",
                        style: GoogleFonts.roboto(
                            color: Colors.amber[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //--------TextField and Flags image inside it --------
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: TextFieldNumber(
                        formKey: phoneformKey,
                        controller: phoneController,
                        initialValue: controller.countryCode?["Image"],
                        onSelected: (index) {
                          controller.countryCode =
                              ListOfCuntry[int.parse(index.toString())];
                          controller.update();
                        }),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                  onPressed: () {
                    //--------the method for login call from 01-LoginController file  --------
                    if (phoneformKey.currentState!.validate()) {
                      controller.nextToOtp(numberPhone: phoneController.text);
                    }
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber[900],
                      boxShadow: kElevationToShadow[4],
                      border: const Border.fromBorderSide(
                          BorderSide(color: Colors.amber, width: 5)),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                          // topRight: Radius.circular(10),
                          ),
                    ),
                    child: Text('Start',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
