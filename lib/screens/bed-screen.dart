import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:allsafe/constants.dart';
import 'package:allsafe/models/hospital-details.dart';
import 'package:allsafe/widgets/widgets.dart';

class BedScreen extends StatefulWidget {
  @override
  _BedScreenState createState() => _BedScreenState();
}

class _BedScreenState extends State<BedScreen> {
  List<Hospital> hospitaldata = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Hospital>> loadData() async {
    var hospitalJson =
        await rootBundle.loadString("assets/data/bedCondition.json");
    var decodedJson = jsonDecode(hospitalJson);

   return List.from(decodedJson)
        .map<Hospital>((hospital) => Hospital.fromMap(hospital))
        .toList();
    // print(HospitalModel.hospitals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          primary: true,
          elevation: 0.0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.12,
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text('Hospitals', style: headlineMain),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: FutureBuilder<List<Hospital>>(
                  future: loadData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      return IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          onPressed: () {
                            // print('bed screen ${snapshot.data}');
                            showSearch(
                                context: context,
                                delegate: DataSearch(snapshot.data));
                          });
                    }
                    return Container();
                  }),
            )
          ],
        ),
        body: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: FutureBuilder<List<Hospital>>(
                future: loadData(),
                builder: (context, snapshot) {
                   if(snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: (snapshot.data!= null &&
                            snapshot.data.isNotEmpty)
                        ? Scrollbar(
                            thickness: 8.0,
                            radius: Radius.circular(20),
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return HospitalWidget(
                                  hospital: snapshot.data[index],
                                );
                              },
                            ),
                          )
                          
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                          
                  );
                  
                
                }
                return Container();
                }
              ),
            ),
          ],
        ));
  }

  Container _buildHeader() {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18))),
    );
  }
}
