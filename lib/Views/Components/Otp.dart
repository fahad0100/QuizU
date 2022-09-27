import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final Function(String)? onChanged;
  const OtpInput(
      {super.key,
      required this.controller,
      required this.autoFocus,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextFormField(
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          style: TextStyle(color: Colors.orange),
          cursorColor: Colors.amber[900],
          decoration: const InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              counterText: '',
              hintStyle: TextStyle(color: Colors.amber, fontSize: 20.0)),
          onChanged: onChanged),
    );
  }
}

// ignore: must_be_immutable
class OtpWidgets extends StatefulWidget {
  OtpWidgets({super.key, required this.isCompleted});
  final ValueSetter<String> isCompleted;

  @override
  State<OtpWidgets> createState() => _OtpWidgetsState();
}

class _OtpWidgetsState extends State<OtpWidgets> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();

  late String otpNumber;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    FocusScope.of(context).isFirstFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OtpInput(
              autoFocus: false,
              controller: controller1,
              onChanged: (value) {
                otpNumber = controller1.text +
                    controller2.text +
                    controller3.text +
                    controller4.text;

                widget.isCompleted(otpNumber);

                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
            OtpInput(
              autoFocus: false,
              controller: controller2,
              onChanged: (value) {
                // completed == true;
                otpNumber = controller1.text +
                    controller2.text +
                    controller3.text +
                    controller4.text;
                widget.isCompleted(otpNumber);

                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
            OtpInput(
              autoFocus: false,
              controller: controller3,
              onChanged: (value) {
                // completed == true;
                otpNumber = controller1.text +
                    controller2.text +
                    controller3.text +
                    controller4.text;

                widget.isCompleted(otpNumber);

                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
            OtpInput(
              autoFocus: false,
              controller: controller4,
              onChanged: (value) {
                otpNumber = controller1.text +
                    controller2.text +
                    controller3.text +
                    controller4.text;

                widget.isCompleted(otpNumber);

                if (value.length != 1) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
