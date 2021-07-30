import 'package:allsafe/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(MdiIcons.alertCircleOutline),
          iconSize: 30,
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text('Last update on'),
                content: const Text('Hospital Details - Sun 13 Jun 2021'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  //preferredsize to get the size and toolbarheight to get height of appbar
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
