import 'dart:convert';
import 'dart:ui';

import 'package:allsafe/constants.dart';
import 'package:allsafe/models/hospital-details.dart';
import 'package:allsafe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        backgroundColor: primaryColor,
        appBar: CustomAppbar(),
        body: CustomScrollView(

          physics: NeverScrollableScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(),
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                sliver: SliverToBoxAdapter(
                  child: StatusGrid(),
                )),
                SliverPadding(
                padding: const EdgeInsets.only(top: 20.0),
                sliver: SliverToBoxAdapter(
                  child: HospitalCard(),
                )),
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    color: Colors.white,
                  ),
                ),
          ],
        ));
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
          child: Text(
        'Cases',
        style: headlineMain,
      )),
    );
  }
}
