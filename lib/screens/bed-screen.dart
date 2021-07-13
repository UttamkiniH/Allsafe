import 'package:flutter/material.dart';

class BedScreen extends StatefulWidget {
  @override
  _BedScreenState createState() => _BedScreenState();
}

class _BedScreenState extends State<BedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Bed_scren',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
