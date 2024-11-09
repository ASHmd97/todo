import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff5D9CEC);

  static const Color lightBackgroundColor = Color(0xffDFECDB);
  static const Color darkBackgroundColor = Color(0xff060E1E);

  static const Color black = Color(0xff363636);

  static const Color white = Color(0xffffffff);

  static const Color gray = Color(0xffC8C9CB);

  static const Color green = Color(0xff61E757);

  static const Color red = Color(0xffEC4B4B);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: lightBackgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: white,
      selectedItemColor: primary,
      unselectedItemColor: gray,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: white,
      shape: CircleBorder(
        side: BorderSide(color: white, width: 4),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: darkBackgroundColor,
  );
}
