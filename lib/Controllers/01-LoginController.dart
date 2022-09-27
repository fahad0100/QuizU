import 'package:get/get.dart';
import 'package:quizapp/Views/UI/01-Login/02-OtpScreen.dart';
import 'package:quizapp/Views/UI/03-StartScreen.dart/01-StartScreen.dart';
import 'package:quizapp/main.dart';

class LoginController extends GetxController {
  Map<String, dynamic>? countryCode = {
    "ID": 0,
    "Name": "Saudi Arabia",
    "Image": "assets/Images/imageSA.png",
    "Code": "966",
  };

  @override
  void onInit() {
    super.onInit();
  }

  nextToOtp({required String numberPhone}) {
    Get.to(() => OtpScreen(
          codeCountry: countryCode?["Code"],
          phoneNumber: numberPhone,
        ));
  }
}

