import 'package:allsafe/constants.dart';
import 'package:allsafe/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final List hospitals = [
    'Akash Hospital',
    // 'address:Ramamurthy Nagar, Bengaluru, Karnataka'},
    'Aster RV Hospital',
    // 'address:Ramamurthy Nagar, Bengaluru, Karnataka'
    'Rajshekar Multi Speciality Hospital Pvt Ltd',
    // 'address:Ramamurthy Nagar, Bengaluru, Karnataka'
    'Narayana Hrudayalaya Private Limited',
    // 'address:Ramamurthy Nagar, Bengaluru, Karnataka',
  ];
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
      child: Column(
        children: <Widget>[
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
            padding: EdgeInsets.symmetric(horizontal:10.0),
              alignment: Alignment.centerRight,
              child: Text(
                '28th May 11:30pm',
                style: TextStyle(fontSize: 15,fontFamily: 'Public Sans',color: primaryColor),
              )),
        ],
      ),
    );
  }

  ListView _hospitalCard() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 15.0),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color(0xFF323380),
                child: HospitalCardDetails(hospitals[index])),
          );
        });
  }
}
