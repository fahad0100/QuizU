import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:quizapp/Server/ClassServer.dart';
import 'package:quizapp/Views/UI/01-Login/01-LoginScreen.dart';
import 'package:quizapp/Views/UI/03-StartScreen.dart/01-StartScreen.dart';

late final FlutterSecureStorage? storage;
late bool _Login;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storage = const FlutterSecureStorage();
  _Login =
      await ServerApi.requestToken(Token: await storage!.read(key: "token"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomTheme.lightTheme,
      home: _Login == true ? StartScreen() : LoginScreen(),
    );
  }
}

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ));
  }
}
