import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Views/Components/SelectCodeCountry.dart';
import 'package:quizapp/Controllers/01-LoginController.dart';
import 'package:quizapp/Model/DataCountryCode.dart';
import 'package:quizapp/Validatation/validatation.dart';

class TextFieldNumber extends StatelessWidget {
  const TextFieldNumber(
      {super.key,
      this.onSelected,
      this.initialValue,
      this.controller,
      this.formKey});
  final Function(Object)? onSelected;
  final String? initialValue;
  final TextEditingController? controller;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          maxLength: 10,
          cursorColor: Colors.orange,
          style: TextStyle(color: Colors.amber[900]),
          validator: validateMobile,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MenuCountry(
                  initialValue: initialValue,
                  onSelected: onSelected,
                ),
              ),
              hintText: "055 555 5555"),
        ),
      ),
    );
  }
}
