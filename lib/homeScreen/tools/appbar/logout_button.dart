import 'package:computiqquizapp/core/Responsive/responsive_screen.dart';
import 'package:flutter/material.dart';

import '../../../app_tools/services.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
    required ResponsiveScreenApp sizeResponsove,
  }) : _sizeResponsove = sizeResponsove, super(key: key);

  final ResponsiveScreenApp _sizeResponsove;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Services.logOut();
          // LogOut Function
        },
        icon:  Icon(Icons.logout, color: Colors.red,size: _sizeResponsove.iconApp,)

    );
  }
}

