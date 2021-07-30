import 'package:allsafe/constants.dart';
import 'package:allsafe/screens/bottom-nav-screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navtoHome();
  }

  _navtoHome() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {},
    );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset('assets/images/icon.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All',
                    style: TextStyle(
                        fontFamily: 'Public Sans',
                        fontSize: 55,
                        color: primaryColor),
                  ),
                  Text(
                    'Safe',
                    style: TextStyle(
                        fontFamily: 'Public Sans',
                        fontSize: 55,
                        color: Color(0xFF7D91F6)),
                  ),
                ],
              ),
            ),
            Text(
              'Safety at your fingertips!',
              style: TextStyle(
                  fontFamily: 'Public Sans',
                  fontSize: 15,
                  color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
