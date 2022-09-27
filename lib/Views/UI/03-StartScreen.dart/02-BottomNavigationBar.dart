import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bottomNavigation({int currentIndex = 0, Function(int)? onTap}) =>
    BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        iconSize: 25,
        onTap: onTap,
        selectedLabelStyle: GoogleFonts.roboto(
            color: Colors.amber[800],
            fontSize: 16,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.roboto(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        items: <BottomNavigationBarItem>[
          itemNavigationBar(
              index: 0,
              title: "Home",
              selecteIndex: currentIndex,
              imageSelected: "home.png",
              imageUnSelected: "homeblack.png"),
          itemNavigationBar(
              index: 1,
              title: "Leaderboard",
              selecteIndex: currentIndex,
              imageSelected: "podium.png",
              imageUnSelected: "podiumblack.png")
        ]);

//------------ widget for item NavigationBar ---------------

itemNavigationBar(
        {required int selecteIndex,
        required int index,
        required String title,
        required String imageSelected,
        required String imageUnSelected}) =>
    BottomNavigationBarItem(
      icon: Image.asset(
        selecteIndex == index
            ? "assets/Images/$imageSelected"
            : "assets/Images/$imageUnSelected",
        width: selecteIndex == index ? 30 : 20,
        height: selecteIndex == index ? 30 : 20,
      ),
      label: title,
    );
