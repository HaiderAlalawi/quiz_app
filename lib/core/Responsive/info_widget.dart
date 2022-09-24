

import 'package:flutter/cupertino.dart';

import 'device_info.dart';
import 'get_device_type.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, required this.builder}) : super(key: key);


  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context , constrains) {

          var mediaQueryData = MediaQuery.of(context);
          var deviceInfo = DeviceInfo(
            orientation: mediaQueryData.orientation,
            deviceType: getDeviceType(mediaQueryData),
            screenWidth: mediaQueryData.size.width,
            screenHeight: mediaQueryData.size.height,
            localHeight: constrains.maxHeight,
            localWidth: constrains.maxWidth,
          );
          return builder(context, deviceInfo);
        }

    );
  }
}
