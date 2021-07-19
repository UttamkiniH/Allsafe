import 'package:allsafe/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BuildDate extends StatefulWidget {
  var dateCodeController = TextEditingController();
  BuildDate(this.dateCodeController);

  @override
  _BuildDateState createState() => _BuildDateState(dateCodeController);
}

class _BuildDateState extends State<BuildDate> {
  var dateCodeController = TextEditingController();
  _BuildDateState(this.dateCodeController);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: TextField(
          controller: dateCodeController,
          keyboardType: TextInputType.number,
          maxLength: 2,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: accentColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: accentColor, width: 3),
            ),
            labelText: 'Date',
            labelStyle: TextStyle(fontFamily: 'Public Sans Normal'),
            hintText: 'Enter Date',
            hintStyle: TextStyle(fontFamily: 'Public Sans Normal'),
            prefixIcon: Icon(
              MdiIcons.calendar,
              color: accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
