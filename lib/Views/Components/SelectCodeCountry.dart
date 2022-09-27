import 'package:flutter/material.dart';
import 'package:quizapp/Model/DataCountryCode.dart';

class MenuCountry extends StatelessWidget {
  MenuCountry({super.key, this.onSelected, this.initialValue});
  final String? initialValue;
  final Function(Object)? onSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => List.generate(3, ((index) {
          return PopupMenuItem(
            value: index.toString(),
            // onTap: (() => initialValue = ListOfCuntry[index][""]),
            child: ListTile(
              leading: Image.asset(
                ListOfCuntry[index]["Image"],
                width: 30,
                fit: BoxFit.cover,
                isAntiAlias: true,
              ),
              title: Text(ListOfCuntry[index]["Name"].toString()),
            ),
          );
        })),
        initialValue: "966",
        onSelected: onSelected,
        child: Image.asset(
          initialValue!,
          width: 30,
          // height: 20,
        ),
      ),
    );
  }
}
