import 'package:flutter/material.dart';

final ThemeData appLightTheme = _buildLightTheme();
final ThemeData appDarkTheme = _buildDarkTheme();

TextTheme _buildTextTheme(TextTheme base, bool isDark, [MaterialColor darkTextColor]) {
  print(isDark);
  Color fontColor = Colors.white;
  if (isDark) {
    fontColor = darkTextColor;
  }

  return base.copyWith(
    display1: base.display1.copyWith(fontWeight: FontWeight.w900),
    title: base.title.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: 21,
        letterSpacing: 0.5,
        color: fontColor),
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = Colors.indigo;
  const Color secondaryColor = Colors.black;
  const Color scaffoldBackgroundColor = Colors.black12;

  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme, true),
  );
}

ThemeData _buildLightTheme() {
  const Color primaryColor = Colors.blue;
  const Color secondaryColor = Colors.white;
  const Color scaffoldBackgroundColor = Colors.white;

  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme, false, primaryColor),
  );
}
