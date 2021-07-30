import 'package:allsafe/models/hospital-details.dart';
import 'package:allsafe/widgets/bed_number.dart';
import 'package:flutter/material.dart';
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
  List<Hospital> hospitals;
  Hospital currentHospital;

  _InformationState(this.suggestion, this.hospitals);

  filterMethod() {
    var filteredHospital = hospitals.where((hospital) {
      if (hospital.hospital_name == suggestion) {
        return true;
      } else {
        return false;
      }
    }).map((Hospital hospital) => hospital);

    if (filteredHospital.isNotEmpty) {
      setState(() {
        currentHospital = filteredHospital.first;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    filterMethod();
  }

  @override
  Widget build(BuildContext context) {
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
        body: currentHospital == null
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          color: primaryColor,
                          child: Text(
                            currentHospital.hospital_name,
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
                              if (currentHospital.hospital_phone != null)
                                Text(
                                  currentHospital.hospital_phone,
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
                        BuildBed(
                            '${currentHospital.available_beds_without_oxygen}',
                            'Normal',
                            '${currentHospital.available_beds_with_oxygen}',
                            'Oxygen'),
                        SizedBox(
                          height: 15,
                        ),
                        BuildBed(
                            '${currentHospital.available_icu_beds_without_ventilator}',
                            'ICU',
                            '${currentHospital.available_icu_beds_with_ventilator}',
                            'Ventilator'),
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
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
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
              if (currentHospital.hospital_address != null)
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentHospital.hospital_address,
                    style: slotFontItalic,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
