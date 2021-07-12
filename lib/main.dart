import 'package:allsafe/constants.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        body: Text(
          'Hello World!',
          style: headlineMain,
        ),
      ),
    ));
  }
}
