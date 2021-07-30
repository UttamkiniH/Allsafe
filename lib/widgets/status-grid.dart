import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatusGrid extends StatefulWidget {
  @override
  _StatusGridState createState() => _StatusGridState();
}

class _StatusGridState extends State<StatusGrid> {
  final String uri = 'https://api.covid19india.org/data.json';

  Map statewiseData;
  Future<Map> dataNeed;

  Future<Map> loadCases() async {
    final response = 
    await http.get(Uri.parse(uri));
    final caseJson =response.body;
    final decodedData = jsonDecode(caseJson);
    statewiseData = decodedData['statewise'][16];
    return statewiseData;
    // CasesModel.statewise = List.from(statewiseData).map<Case>((caseList) => Case.fromMap(caseList)).toList();
  }

  @override
  void initState() {
    dataNeed = loadCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        //first to display 2 widgets vertical
        children: <Widget>[
          //1st widget
          Flexible(
              //displaying 1st column widget in horizontal ways
              child: Row(
            children: <Widget>[
              FutureBuilder(
                  future: dataNeed,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return _buildStatCard(
                          'Confirmed',
                          snapshot.data["confirmed"],
                          Color(0xFFFF9F9F),
                          Color(0xFFE94545),
                          Color(0xFFF10000));
                    } else {
                      return _buildStatCard(
                          'Confirmed',
                          'Waiting',
                          Color(0xFFFF9F9F),
                          Color(0xFFE94545),
                          Color(0xFFF10000));
                    }
                  }),
              FutureBuilder(
                  future: dataNeed,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {

                      return _buildStatCard(
                          'Active',
                          snapshot.data["active"],
                          Color(0xFF99C2FF),
                          Color(0xFF4B6BDA),
                          Color(0xFF0B3CEA));
                    } else {
                      return _buildStatCard(
                          'Active',
                          'Waiting',
                          Color(0xFF99C2FF),
                          Color(0xFF4B6BDA),
                          Color(0xFF0B3CEA));
                    }
                  }),
            ],
          )),
          Flexible(
              //displaying 1st column widget in horizontal ways
              child: Row(
            children: <Widget>[
              FutureBuilder(
                  future: dataNeed,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return _buildStatCard(
                          'Recovered',
                          snapshot.data["recovered"],
                          Color(0xFF00B17C),
                          Color(0xFF00552C),
                          Color(0xFF00611B));
                    } else {
                      return _buildStatCard(
                          'Recovered',
                          'Waiting',
                          Color(0xFF00B17C),
                          Color(0xFF00552C),
                          Color(0xFF00611B));
                    }
                  }),
              FutureBuilder(
                  future: dataNeed,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return _buildStatCard(
                          'Deceased',
                          snapshot.data["deaths"],
                          Color(0xFFC5C5C5),
                          Color(0xFF363636),
                          Color(0xFF444444));
                    } else {
                      return _buildStatCard(
                          'Deceased',
                          'Waiting',
                          Color(0xFFC5C5C5),
                          Color(0xFF363636),
                          Color(0xFF444444));
                    }
                  }),
            ],
          )),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, Color color,
      Color titleColor, Color countColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(7.0),
        padding: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        //for total case and number in vertical way
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Public Sans',
                  fontSize: 18,
                  color: titleColor,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(count,
                  style: TextStyle(
                      fontFamily: 'Public Sans',
                      fontSize: 18,
                      color: countColor,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
