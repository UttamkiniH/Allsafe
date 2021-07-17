import 'package:flutter/material.dart';

class HospitalCardDetails extends StatelessWidget {
  final String title1;

  HospitalCardDetails(this.title1);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(12.0),
          child: Text(
            title1,
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
                '628',
                style: TextStyle(
                    fontFamily: 'Public Sans',
                    color: Colors.white,
                    fontSize: 25),
              )),
              SizedBox(width: 5),
              Container(
                  child: Text(
                '88',
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
