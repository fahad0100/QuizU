import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Views/Components/loadingWidgets.dart';
import 'package:quizapp/Model/UserModel.dart';
import 'package:quizapp/Server/ClassServer.dart';

import 'package:quizapp/main.dart';

class ProfileController extends GetxController {
  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerPhone = TextEditingController();
  UserModel? userInfo;
  String? scoreUser = "0";

  @override
  void onInit() {
    super.onInit();
    getInfoUser();
  }

  getInfoUser() async {
    var getInfo = await ServerApi.getData(endPoint: "UserInfo");

    userInfo = UserModel.fromJson(getInfo);
    controllerName?.text = userInfo!.name.toString();
    controllerPhone?.text = userInfo!.mobile.toString();
    scoreUser = await storage!.read(key: "score") ?? 0.toString();

    update();
  }

  setName({String? nameUser, String? mobile}) async {
    loadingWidgets(title: "Wait Please ...");
    Map<String, dynamic> response = await ServerApi.postData(
        endPoint: "Name",
        Token: await storage!.read(key: "token"),
        data: {"name": nameUser!, "mobile": mobile!});
    if (response["success"] == true) {
      print(response);
      Get.close(0);
      Get.back();
    } else {
      Get.close(0);
    }
  }
}
