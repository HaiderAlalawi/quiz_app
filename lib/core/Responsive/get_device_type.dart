

import 'package:flutter/cupertino.dart';

import 'device_type.dart';


DeviceType getDeviceType(MediaQueryData mediaQueryData) {

  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  if(orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  }else {
    width = mediaQueryData.size.width;
  }
  print("width" + width.toString());

  if(width >= 1100) {
    return DeviceType.Desktop;
  }
  if(width >= 650 && width < 1100) {
    return DeviceType.Tablet;
  }
  return DeviceType.Mobile;

}