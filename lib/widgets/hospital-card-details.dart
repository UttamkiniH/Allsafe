import 'package:allsafe/models/hospital-details.dart';
import 'package:flutter/material.dart';

class HospitalCardDetails extends StatefulWidget {
  final Hospital hospital;

  const HospitalCardDetails({Key key, @required this.hospital})
      : assert(hospital != null),
        super(key: key);

  @override
  _HospitalCardDetailsState createState() => _HospitalCardDetailsState();
}

class _HospitalCardDetailsState extends State<HospitalCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(12.0),
          child: Text(
            widget.hospital.hospital_name,
            style: TextStyle(
                fontFamily: 'Public Sans', color: Colors.white, fontSize: 24),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: Text(
                '${widget.hospital.available_beds_without_oxygen}',
                style: TextStyle(
                    fontFamily: 'Public Sans',
                    color: Colors.white,
                    fontSize: 25),
              )),
              SizedBox(width: 5),
              Container(
                  child: Text(
                '${widget.hospital.available_beds_with_oxygen}',
                style: TextStyle(
                    fontFamily: 'Public Sans',
                    color: Colors.white,
                    fontSize: 25),
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: Text(
                'Normal(Without)',
                style: TextStyle(
                    fontFamily: 'Public Sans',
                    color: Colors.white,
                    fontSize: 15),
              )),
              SizedBox(width: 5),
              Container(
                  child: Text(
                'Oxygen(with)',
                style: TextStyle(
                    fontFamily: 'Public Sans',
                    color: Colors.white,
                    fontSize: 15),
              )),
            ],
          ),
        ),
      ],
    ));
  }
}
