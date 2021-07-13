import 'package:flutter/material.dart';

class VaccineScreen extends StatefulWidget {
  @override
  _VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'vaccine_screen',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
