import 'package:flutter/material.dart';

final ThemeData photoGalleryTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color.fromARGB(255, 250, 250, 255),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Rooster',
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 40,
    ),
    headlineMedium: TextStyle(
      color: Color.fromARGB(255, 206, 229, 255),
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 120, 125, 140),
      fontSize: 22,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 120, 125, 140),
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 206, 229, 255),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      color: Color(0xffeeeeee),
      fontSize: 17,
      fontWeight: FontWeight.w600,
      shadows: [
        Shadow(
          blurRadius: 2.0,
          color: const Color.fromARGB(255, 0, 0, 0),
          offset: Offset(1.0, 1.0),
        ),
      ],
    ),
    displaySmall: TextStyle(
      color: Color.fromRGBO(130, 130, 130, 1),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: Color.fromRGBO(245, 245, 245, 1),
      fontSize: 15,
      height: 1.3,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      letterSpacing: 0.0,
    ),
  ),
);
