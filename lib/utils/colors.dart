import 'package:flutter/material.dart';

mixin AppColors {
  static const MaterialColor kSwatch = Colors.green;
  static const Color kGreen = Color.fromRGBO(52, 168, 83, 1.0);
  static const Color kGreenT = Color.fromRGBO(52, 168, 83, 0.8);
  static const Color kLight = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color kLight2 = Color.fromRGBO(230, 230, 230, 1.0);
  static const Color kLight3 = Color.fromRGBO(240, 240, 240, 1.0);
  static const Color kBlackT = Color.fromRGBO(0, 0, 0, 0.4);

}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    String _hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (_hexColor.length == 6) {
      _hexColor = "FF$_hexColor";
    }
    return int.parse(_hexColor, radix: 16);
  }
}
