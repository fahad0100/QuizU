import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.color = Colors.orange});
  final String title;
  final Color? color;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
              boxShadow: kElevationToShadow[4],
              color: color,
              borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          child: Text(title.toString(),
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
