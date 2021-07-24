import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:allsafe/constants.dart';
import 'package:allsafe/models/hospital-details.dart';
import 'package:allsafe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HospitalCard extends StatefulWidget {
  @override
  _HospitalCardState createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  final String URL = 'https://api.covid19india.org/data.json';

  Map statewiseData;
  Future<Map> dataNeed;

  Future<Map> loadCases() async {
    final response = 
    await http.get(Uri.parse(URL));
    final caseJson =response.body;
    final decodedData = jsonDecode(caseJson);
    statewiseData = decodedData['statewise'][16];
    return statewiseData;
  }

  @override
  void initState() {
    dataNeed = loadCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Hospitals',
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'Public Sans',
              color: primaryColor,
            ),
          ),
        ),
        Expanded(
          child: _hospitalCard(),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.centerRight,
          child: FutureBuilder(
              future: dataNeed,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data["lastupdatedtime"],
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Public Sans',
                        color: primaryColor),
                  );
                } else {
                  return Text(
                    'Waiting',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Public Sans',
                        color: primaryColor),
                  );
                }
              }),
        ),
      ]),
    );
  }

  Widget _hospitalCard() {
    return (HospitalModel.hospitals != null &&
            HospitalModel.hospitals.isNotEmpty)
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HospitalModel.hospitals.take(5).length,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 15.0),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color(0xFF323380),
                    child: HospitalCardDetails(
                        hospital: HospitalModel.hospitals[index])),
              );
            })
        : Center(
            child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(accentColor),
          ));
  }
}

// Text(
//                 '28th May 11:30pm',
//                 style: TextStyle(fontSize: 15,fontFamily: 'Public Sans',color: primaryColor),
//               )),
