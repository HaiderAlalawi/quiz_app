import 'package:flutter/material.dart';

import '../../app_tools/services.dart';
import '../../core/Responsive/responsive_screen.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    Key? key,
    required ResponsiveScreenApp sizeResponsove,
  }) : _sizeResponsove = sizeResponsove, super(key: key);

  final ResponsiveScreenApp _sizeResponsove;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Image.asset(
        "images/image.png",
        width: _sizeResponsove.iconAppBar,
      ),

      actions: [
        IconButton(
            onPressed: () {
              Services.logOut();
              // LogOut Function
            },
            icon:  Icon(Icons.logout, color: Colors.red,size: _sizeResponsove.iconApp,)

        )
      ],
    );
  }
}
