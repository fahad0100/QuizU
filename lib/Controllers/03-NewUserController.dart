import 'package:get/get.dart';
import 'package:quizapp/Views/Components/loadingWidgets.dart';
import 'package:quizapp/Server/ClassServer.dart';
import 'package:quizapp/Views/UI/03-StartScreen.dart/01-StartScreen.dart';
import 'package:quizapp/main.dart';

class NewUserController extends GetxController {
  setName({String nameUser = "Okoul"}) async {
    loadingWidgets(title: "Wait Please ...");
    Map<String, dynamic> response = await ServerApi.postData(
        endPoint: "Name",
        Token: await storage!.read(key: "token"),
        data: {"name": nameUser});
    if (response["success"] == true) {
      Get.close(0);
      Get.offAll(() =>  StartScreen());
    } else {
      Get.close(0);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
