import 'dart:convert';
import 'dart:ui';
import 'package:allsafe/screens/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:allsafe/constants.dart';
import 'package:allsafe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VaccineScreen extends StatefulWidget {
  @override
  _VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {
  final pinCodeController = TextEditingController();
  final dateCodeController = TextEditingController();
  String dropdownValue = '01';
  List slots = [''];

  fetchSlots() async {
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                pinCodeController.text +
                '&date=' +
                dateCodeController.text +
                '-' +
                dropdownValue +
                '-2021'))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
      });
      (slots != null && slots.isNotEmpty)
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => Slots(slots: slots)))
          : Fluttertoast.showToast(
              msg: "Slots are Empty",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.black,
              fontSize: 15.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        centerTitle: true,
        title: Text(
          'Vaccine',
          style: headlineMain,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              child: Text(
                'Hi There!',
                style: hiStyle,
              )),
          Center(
            child: imageClip(),
          ),
          PinCode(pinCodeController: pinCodeController),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            // color: Colors.yellow,
            // padding: const EdgeInsets.all(25.0),
            //row for two widgets -> 1. date, 2. dropdown
            child: Row(
              children: [
                //1.date widget
                BuildDate(dateCodeController),
                SizedBox(
                  width: 10,
                ),
                //2.dropdown widget
                Flexible(
                  child: Container(
                    height: 58,
                    margin: EdgeInsets.only(bottom: 25),
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 2, color: accentColor),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(MdiIcons.chevronDown),
                        iconSize: 30,
                        iconEnabledColor: accentColor,
                        elevation: 16,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'Public Sans Normal',
                            fontWeight: FontWeight.w600),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          '01',
                          '02',
                          '03',
                          '04',
                          '05',
                          '06',
                          '07',
                          '08',
                          '09',
                          '10',
                          '11',
                          '12'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _buildSubmitButton()
        ],
      ),
    ));
  }

  Container imageClip() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: primaryColor),
        ),
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Image.asset(
          'assets/images/nurse.png',
        ));
  }

  Widget _buildSubmitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2, color: primaryColor),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.done,
                  size: 30,
                  color: accentColor,
                ),
                onPressed: () {
                  return fetchSlots();
                })),
      ],
    );
  }
}
