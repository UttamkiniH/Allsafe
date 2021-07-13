import 'package:allsafe/constants.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final List<int> numbers = [
    1,
    2,
    3,
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
            padding: const EdgeInsets.all(20.0),
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
          )
        ],
      ),
    );
  }

  ListView _hospitalCard() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Color(0xFF323380),
              child: Container(
                child: Center(
                    child: Text(
                  numbers[index].toString(),
                  style: TextStyle(color: Colors.white, fontSize: 36.0),
                )),
              ),
            ),
          );
        });
  }
}
