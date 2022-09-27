import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:quizapp/Server/ConstData.dart';
import 'package:quizapp/main.dart';

class ServerApi {
  static requestToken({String? Token}) async {
    http.Response response = await http.get(
      Uri.parse(urlApi + "Token"),
      headers: {
        'Authorization': 'Bearer $Token',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );
    var jsonResponse =
        await convert.jsonDecode(response.body) as Map<String, dynamic>;

    return jsonResponse["success"];
  }

  //!------------------------------------

  static postData(
      {required endPoint,
      required Map<String, String> data,
      String? Token}) async {
    http.Response response = await http.post(Uri.parse(urlApi + endPoint),
        headers: {
          'Authorization': Token != null ? 'Bearer $Token' : '',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: data);
    var jsonResponse =
        await convert.jsonDecode(response.body) as Map<String, dynamic>;
    if (jsonResponse["success"] == true) {
      return jsonResponse;
    } else {
      Get.snackbar(
          "Wrong", 'Request failed with status: ${response.statusCode}.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2));
    }
  }

  //!------------------------------------

  static getData({required endPoint}) async {
    String? token = await storage!.read(key: "token");

    http.Response response = await http.get(
      Uri.parse(urlApi + endPoint),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = await convert.jsonDecode(response.body);

      return jsonResponse;
    } else {
      Get.snackbar(
          "Wrong", 'Request failed with status: ${response.statusCode}.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2));
    }
  }
}
