
import 'package:flutter/cupertino.dart';

import 'device_type.dart';
import 'get_device_type.dart';


class ResponsiveScreenApp {
  BuildContext context;
  MediaQueryData mediaQueryData;

  ResponsiveScreenApp(this.context, this.mediaQueryData);



   double get iconApp {
    if(getDeviceType(mediaQueryData) == DeviceType.Desktop) {
      return 50.0;
    }

    if(getDeviceType(mediaQueryData) == DeviceType.Tablet) {
      return 45.0;
    }
    return 30.0;
  }

  double get iconAppBar {
    if(getDeviceType(mediaQueryData) == DeviceType.Desktop) {
      return 180.0;
    }

    if(getDeviceType(mediaQueryData) == DeviceType.Tablet) {
      return 160.0;
    }
    return 100.0;
  }


  double get radiusImageApp {
    if(getDeviceType(mediaQueryData) == DeviceType.Desktop) {
      return 400.0;
    }

    if(getDeviceType(mediaQueryData) == DeviceType.Tablet) {
      return 600.0;
    }
    return 200.0;
  }

  double get heightRadiusImageApp {
    if(getDeviceType(mediaQueryData) == DeviceType.Desktop) {
      return 400.0;
    }

    if(getDeviceType(mediaQueryData) == DeviceType.Tablet) {
      return 400.0;
    }
    return 250.0;
  }

  double get textResponsiveApp {
    if(getDeviceType(mediaQueryData) == DeviceType.Desktop) {
      return 40.0;
    }

    if(getDeviceType(mediaQueryData) == DeviceType.Tablet) {
      return 35.0;
    }
    return 25.0;
  }

  double get highCategory {
    if(getDeviceType(mediaQueryData) == DeviceType.Desktop) {
      return 350.0;
    }

    if(getDeviceType(mediaQueryData) == DeviceType.Tablet) {
      return 350.0;
    }
    return 250.0;
  }


  double get imageCategory {
    if(getDeviceType(mediaQueryData) == DeviceType.Desktop) {
      return 270.0;
    }

    if(getDeviceType(mediaQueryData) == DeviceType.Tablet) {
      return 260.0;
    }
    return 180.0;
  }
}