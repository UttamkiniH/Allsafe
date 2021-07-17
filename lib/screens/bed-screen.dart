import 'package:allsafe/constants.dart';
import 'package:allsafe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:allsafe/models/hospital-details.dart';

class BedScreen extends StatefulWidget {
  @override
  _BedScreenState createState() => _BedScreenState();
}

class _BedScreenState extends State<BedScreen> {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => HospitalModel.hospitals[0]);
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
                child: ListView.builder(
                  itemCount: dummyList.length,
                  itemBuilder: (context, index) {
                    return HospitalWidget(
                      hospital: dummyList[index],
                    );
                  },
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

