import 'package:flutter/material.dart';
import 'package:flutter_template/colors.dart';

ThemeData theme() {
  return ThemeData(
      fontFamily: 'Muli',
      appBarTheme: const AppBarTheme(
          backgroundColor: whiteColor,
          iconTheme: IconThemeData(color: blackColor)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 12,
        ),
        displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
        displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
        headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
        headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
        titleLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ));
}
