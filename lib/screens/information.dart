import 'dart:convert';

import 'package:allsafe/models/hospital-details.dart';
import 'package:allsafe/widgets/bed_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constants.dart';

class Information extends StatefulWidget {
  String suggestions;
  List<Hospital> hospital;
  Information(
    this.suggestions,
    this.hospital,
  );

  @override
  _InformationState createState() =>
      _InformationState(this.suggestions, this.hospital);
}

class _InformationState extends State<Information> {
  String suggestion;
  List<Hospital> hospital;

  _InformationState(this.suggestion, this.hospital);
  
  

  @override
  Widget build(BuildContext context) {
    // print('Hospital model ${HospitalModel.hospitals}');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: primaryColor,
          title: Text(
            'Hopital Details',
            style: TextStyle(fontFamily: 'Public Sans', fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    color: primaryColor,
                    child: Text(
                      suggestion,
                      style: TextStyle(
                          fontFamily: 'Public Sans Normal',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                         '',
                          style: TextStyle(
                              fontFamily: 'Public Sans',
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text('Beds Available', style: hiStyle),
                  ),
                  BuildBed('245', 'Normal', '25', 'Oxygen'),
                  SizedBox(
                    height: 15,
                  ),
                  BuildBed('5', 'ICU', '15', 'Ventilator'),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                    alignment: Alignment.centerLeft,
                    child: Text('Address', style: hiStyle),
                  ),
                  _buildAddress(),
                ],
              ),
            ],
          ),
        ));
  }

  Container _buildAddress() {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Icon(
                MdiIcons.mapMarker,
                size: 30,
                color: accentColor,
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'No. 1, Old No. 28, Platform Road Near Mantri Square Mall, VV Giri Colony, Seshadripuram, Bengaluru, Karnataka 560020, India',
              style: slotFontItalic,
            ),
          ),
        ],
      ),
    );
  }
}
