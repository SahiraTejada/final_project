import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

ThemeData customTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: titleStyle,
    iconTheme: const IconThemeData(color: titleColor),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: lightGray,
    selectedItemColor: orange,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding:
          const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 13)),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    ),
  ),
  fontFamily: 'Inter',
  scaffoldBackgroundColor: backgroundColor,
  primarySwatch: orange,
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: lightGray),
      borderRadius: BorderRadius.circular(40),
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  hintColor: hintTextColor,
);
