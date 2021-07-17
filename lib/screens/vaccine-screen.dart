import 'dart:ui';

import 'package:allsafe/constants.dart';
import 'package:allsafe/widgets/custom-app-bar.dart';
import 'package:flutter/material.dart';

class VaccineScreen extends StatefulWidget {
  @override
  _VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        centerTitle: true,
        title: Text(
          'Vaccine',
          style: headlineMain,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(8),
              child: Text(
                'Hi There!',
                style: hiStyle,
              )),
          Center(
            child: imageClip(),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Pincode',
              ),
            ),
          ),
          Flexible(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: primaryColor),
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.done,
                      size: 30,
                      color: accentColor,
                    ),
                    onPressed: () {
                      print('susmitted');
                    })),
          )
        ],
      ),
    ));
  }

  Container imageClip() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: primaryColor),
        ),
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Image.asset(
          'assets/nurse.png',
        ));
  }
}
