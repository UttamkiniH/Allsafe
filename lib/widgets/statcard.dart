import 'package:flutter/material.dart';

class BuildStatCard extends StatelessWidget {
  final Map statewiseData;

  const BuildStatCard({Key key, this.statewiseData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
        //displaying 1st column widget in horizontal ways
        child: Row(
      children: <Widget>[
        _buildStatCard('Confirmed', statewiseData['confirmed'].toString(),
            Color(0xFFFF9F9F), Color(0xFFE94545), Color(0xFFF10000)),
        _buildStatCard('Active', statewiseData['confirmed'].toString(),
            Color(0xFF99C2FF), Color(0xFF4B6BDA), Color(0xFF0B3CEA)),
      ],
    ));
  }

  Expanded _buildStatCard(String title, String count, Color color,
      Color titleColor, Color countColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(7.0),
        padding: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        //for total case and number in vertical way
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Public Sans',
                  fontSize: 18,
                  color: titleColor,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(count,
                  style: TextStyle(
                      fontFamily: 'Public Sans',
                      fontSize: 18,
                      color: countColor,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
