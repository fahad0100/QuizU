import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Views/Components/Otp.dart';
import 'package:quizapp/Controllers/02-OtpController.dart';
import 'package:quizapp/Views/UI/04-Tabs/01-HomeScreen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phoneNumber, required this.codeCountry});
  //--------variable--------
  final String phoneNumber;
  final String codeCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          Center(
            child: Text("QuizU",
                style: GoogleFonts.roboto(
                    color: Colors.amber[900],
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Center(
            child: Text(
              "Please enter the OTP sent to your mobile",
              style: GoogleFonts.roboto(
                  color: Colors.amber[900],
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "+" + codeCountry.toString() + " " + phoneNumber.toString(),
                style: GoogleFonts.roboto(
                    color: Colors.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //--------TextField for OTP and method call from 02-OtpController file  --------
          GetBuilder<OtpController>(
              init: OtpController(),
              builder: (controller) {
                return OtpWidgets(
                  isCompleted: (value) {
                    controller.checkOTP(
                        otp: value.toString(), phoneNumber: phoneNumber);
                  },
                );
              }),
        ],
      ),
    );
  }
}
