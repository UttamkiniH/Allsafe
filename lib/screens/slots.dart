import 'package:allsafe/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Slots extends StatefulWidget {
  final List slots;
  const Slots({Key key, @required this.slots})
      : assert(slots != null),
        super(key: key);

  @override
  _SlotsState createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        centerTitle: true,
        title: Text(
          'Available Slots',
          style: headlineMain,
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: widget.slots.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: primaryColor, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  // color: Colors.yellow,
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '' + widget.slots[index]['name'].toString(),
                        style:
                            TextStyle(fontFamily: 'Public Sans', fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Center ID : ' +
                              widget.slots[index]['center_id'].toString(),
                          style: slotFontNormal),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            MdiIcons.mapMarker,
                            color: cardColor,
                            size: 25,
                          ),
                          Flexible(
                            child: Text(
                                '' + widget.slots[index]['address'].toString(),
                                style: slotFontNormal),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        endIndent: 50,
                        color: accentColor,
                      ),
                      Icon(MdiIcons.needle, color: accentColor, size: 25),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Vacine : ' +
                              widget.slots[index]['vaccine'].toString(),
                          style: slotFontItalic),
                      Text(
                          'Dose 1 : ' +
                              widget.slots[index]['available_capacity_dose1']
                                  .toString(),
                          style: slotFontItalic),
                      Text(
                          'Dose 2 : ' +
                              widget.slots[index]['available_capacity_dose2']
                                  .toString(),
                          style: slotFontItalic),
                      Divider(
                        thickness: 1.5,
                        endIndent: 50,
                        color: accentColor,
                      ),
                      Text('' + widget.slots[index]['slots'].toString(),
                          style: slotFontNormal),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
