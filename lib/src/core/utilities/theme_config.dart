import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../main.dart';

class ThemeConfig {
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color font = const Color.fromRGBO(9, 8, 8, 1.0);
  static Color grey_dark = const Color.fromRGBO(9, 8, 8, 1.0);
  static Color grey = const Color.fromRGBO(128, 128, 128, 1.0);
  static Color greyLight = const Color.fromRGBO(211, 211, 211, 1.0);
  static Color primary =
  Color.fromRGBO(Colors.blue.red, Colors.blue.green, Colors.blue.blue, 1);
  static Color teal = Colors.teal[400]!;
  static Color greyForBlackThemePointTwo = Colors.grey.withOpacity(0.2);
  static Color greyForBlackThemePointFive = Colors.grey.withOpacity(0.5);
  static Color greyForBlackTheme = Colors.grey;
  static Color red = Colors.red;
  static Color green = Colors.green;
  static Color cardColorSkyBlue = HexColor("20DEFF");
  static Color cardColorGreen = HexColor("28A745");
  static Color cardColorMeroon = HexColor("C388F6");
  static Color cardColorDeepYellow = HexColor("F1B44C");
  static Color primaryColor = Theme.of(navigatorKey.currentContext!).primaryColor;
  static Color logoColor = HexColor("149CCE");
}
