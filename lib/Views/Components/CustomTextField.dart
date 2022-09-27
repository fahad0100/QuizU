import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, this.controller, this.label});

  final String hintText;
  final String? label;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              label: Text(label ?? ""),
              labelStyle: GoogleFonts.roboto(
                  color: Colors.amber[900],
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              hintStyle: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ),
      ),
    );
  }
}
