import 'package:allsafe/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PinCode extends StatelessWidget {
  var pinCodeController;
  PinCode({this.pinCodeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(25.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          controller: pinCodeController,
          keyboardType: TextInputType.number,
          maxLength: 6,
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
            labelText: 'PIN code',
            labelStyle: TextStyle(fontFamily: 'Public Sans Normal'),
            hintText: 'Enter your PIN code',
            hintStyle: TextStyle(fontFamily: 'Public Sans Normal'),
            prefixIcon: Icon(
              MdiIcons.mapMarker,
              color: accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
