import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:allsafe/constants.dart';

class BuildBed extends StatefulWidget {
  String firstNumber,normal,secondNumber,oxygen;
  BuildBed( this.firstNumber, this.normal, this.secondNumber,this.oxygen);

  

  @override
  _BuildBedState createState() => _BuildBedState(this.firstNumber, this.normal, this.secondNumber,this.oxygen);
}

class _BuildBedState extends State<BuildBed> {
  String firstNumber,normal,secondNumber,oxygen;
  _BuildBedState(this.firstNumber, this.normal, this.secondNumber,this.oxygen);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: accentColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    firstNumber,
                    style: buildNumberFont,
                  ),
                  Text(
                    normal,
                    style: buildBedFont,
                  ),
                ],
              )),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: accentColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    secondNumber,
                    style: buildNumberFont,
                  ),
                  Text(oxygen, style: buildBedFont),
                ],
              )),
        ],
      ),
    );
  }
}