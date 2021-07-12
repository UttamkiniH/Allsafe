import 'package:allsafe/screens/screens.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: SafeArea(
          child: BottomNavScreen(),
        ));
  }
}
