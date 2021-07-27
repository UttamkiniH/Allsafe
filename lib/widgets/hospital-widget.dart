import 'package:allsafe/constants.dart';
import 'package:allsafe/models/hospital-details.dart';
import 'package:allsafe/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HospitalWidget extends StatelessWidget {
  final Hospital hospital;

  const HospitalWidget({Key key, @required this.hospital})
      : assert(hospital != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Card(
        
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Information(hospital.hospital_name,HospitalModel.hospitals),
                ),
              );

          },
          leading: Icon(
            MdiIcons.hospitalBoxOutline,
            color: accentColor,
            size: 30,
          ),
          title: Text(
            hospital.hospital_name,
            style: TextStyle(
                fontFamily: 'Public Sans Normal',
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: accentColor,
                ),
                SizedBox(width: 10),
                if (hospital.hospital_phone != null)
                  Text(
                    hospital.hospital_phone,
                    style: TextStyle(
                        fontFamily: 'Public Sans Normal',
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontSize: 15),
                  ),
              ],
            ),
          ),
          trailing: Text('${hospital.available_beds_without_oxygen}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
        ),
      ),
    );
  }
}
