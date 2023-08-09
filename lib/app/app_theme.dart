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
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        switchTheme: const SwitchThemeData(
          trackOutlineColor: MaterialStatePropertyAll(Colors.white),
          trackColor: MaterialStatePropertyAll(Colors.white),
          thumbColor: MaterialStatePropertyAll(Colors.deepOrange),
        ),
      );
}
