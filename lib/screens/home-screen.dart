import 'package:allsafe/constants.dart';
import 'package:allsafe/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
