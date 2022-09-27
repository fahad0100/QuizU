import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

loadingWidgets({required String title}) {
  return Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: Colors.amber[900],
      title: title,
      titleStyle: GoogleFonts.roboto(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      content: Container(
        alignment: Alignment.center,
        color: Colors.amber[900],
        child: const CircularProgressIndicator(
          color: Colors.black,
          backgroundColor: Colors.white,
        ),
      ));
}
