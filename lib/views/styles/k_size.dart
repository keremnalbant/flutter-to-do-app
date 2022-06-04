import 'package:flutter/material.dart';
import 'package:listify/services/navigation_service.dart';

class KSize {
  static Size get screenSize =>
      MediaQuery.of(Navigation.key.currentContext).size;

  static double getWidth(width) {
    double _width =
        (width / 720) * (screenSize.width > 700 ? 700 : screenSize.width);
    return _width;
  }

  static double getHeight(height) {
    double _height =
        (height / 1600) * (screenSize.height > 1080 ? 1080 : screenSize.height);
    return _height;
  }
}
