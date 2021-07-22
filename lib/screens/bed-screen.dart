import 'package:allsafe/constants.dart';
import 'package:allsafe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:allsafe/models/hospital-details.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class BedScreen extends StatefulWidget {
  @override
  _BedScreenState createState() => _BedScreenState();
}

class _BedScreenState extends State<BedScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var hospitalJson =
        await rootBundle.loadString("assets/data/bedCondition.json");
    var decodedJson = jsonDecode(hospitalJson);
    HospitalModel.hospitals = List.from(decodedJson)
        .map<Hospital>((hospital) => Hospital.fromMap(hospital))
        .toList();
        if (this.mounted) {
  setState(() {
    
  });
}
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
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  }),
            )
          ],
        ),
        body: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: (HospitalModel.hospitals!=null && HospitalModel.hospitals.isNotEmpty)? ListView.builder(
                  itemCount: HospitalModel.hospitals.length,
                  itemBuilder: (context, index) {
                    return HospitalWidget(
                      hospital: HospitalModel.hospitals[index],
                    );
                  },
                ): Center(
                  child: CircularProgressIndicator(),
                ),
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
