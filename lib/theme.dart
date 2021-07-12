import 'package:flutter/material.dart';

ThemeData appTheme() {
  TextTheme _appTextTheme(TextTheme base) {
    return base.copyWith(
      headline5: base.headline5.copyWith(
        fontFamily: 'Public Sans',
        // color: primaryColor,
        fontSize: 30,
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _appTextTheme(base.textTheme),
    primaryColor: Color.fromRGBO(56, 57, 128, 1),
    // accentColor:
  );
}
