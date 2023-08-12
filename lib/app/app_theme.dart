import 'package:flutter/material.dart';

class AppTheme {
  /// 浅色模式
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        splashFactory: InkSparkle.splashFactory,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle:
              TextStyle(fontSize: 20, letterSpacing: 1, color: Colors.black),
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        switchTheme: SwitchThemeData(
          trackOutlineColor: MaterialStatePropertyAll(Colors.grey.shade200),
          trackColor: const MaterialStatePropertyAll(Colors.white),
          thumbColor: const MaterialStatePropertyAll(Colors.deepOrange),
        ),
      );
}
