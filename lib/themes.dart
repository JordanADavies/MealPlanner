import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  primarySwatch: MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  ),
  primaryColor: Colors.white,
  accentColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
  ),
  cardTheme: CardTheme(
    color: Colors.grey[300],
    margin: EdgeInsets.symmetric(vertical: 4.0),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.black,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 20.0)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    ),
  ),
);
