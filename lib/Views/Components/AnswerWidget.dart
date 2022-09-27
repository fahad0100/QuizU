
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  AnswerWidget({
    super.key,
    required this.answerCode,
    required this.answerValue,
    this.onTap,
    this.bacgroundColor = Colors.white,
  });
  final String answerCode;
  final String answerValue;
  final Color? bacgroundColor;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            color: bacgroundColor,
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(50)),
              child: Text(answerCode.toString()),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.red,
                  child: Text(answerValue.toString()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
