import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Views/Components/loadingWidgets.dart';
import 'package:quizapp/Server/ClassServer.dart';
import 'package:quizapp/Views/UI/02-NewUser/01-NewUserScreen.dart';
import 'package:quizapp/Views/UI/03-StartScreen.dart/01-StartScreen.dart';
import 'package:quizapp/main.dart';

class OtpController extends GetxController {
  checkOTP({required String otp, required String phoneNumber}) async {
    if (otp.length != 4) {
      return;
    }
    loadingWidgets(
      title: "Wait until process"
    );
    if (otp.isNotEmpty && otp == "0000") {
      Map<String, String> bodyAPI = {"OTP": otp, "mobile": phoneNumber};

      Map<String, dynamic> response =
          await ServerApi.postData(endPoint: "Login", data: bodyAPI);
      Get.close(0);
      if (response["user_status"] == "new" || response["name"] == null) {
        storage?.write(key: "token", value: response["token"]);

        Get.offAll(() => NewUserScreen());
      } else {
        storage?.write(key: "token", value: response["token"]);
        Get.offAll(() =>  StartScreen());
      }
    } else {
      Get.close(0);
      Get.snackbar("Wrong", "You must enter OTP 0000",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2));
    }
  }
}
