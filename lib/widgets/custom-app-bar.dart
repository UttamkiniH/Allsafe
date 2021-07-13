import 'package:allsafe/constants.dart';
import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          iconSize: 30,
          onPressed: () {},
        ),
        actions: <Widget> [
            IconButton(
          icon: Icon(Icons.notifications_none_outlined),
          iconSize: 30,
          onPressed: () {},
        )
        ],
        );
  }

  //preferredsize to get the size and toolbarheight to get height of appbar
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
