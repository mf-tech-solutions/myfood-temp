import 'package:flutter/material.dart';

class Constants {
  static Color get primaryColor => Colors.deepOrange[600];

  static Color get primaryColorLight => Colors.deepOrange[500];

  static Color get primarySwatch => Colors.deepOrange;

  static Color get accentColor => Colors.deepOrange[600];

  static Color get scaffoldBackgroundColor => Color(0xFFF2F2F2);

  static Color get blackTextColor => Colors.black87;

  static String get loremIpsum =>
      'Enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et';

  static Duration get pageTransitionDuration => Duration(milliseconds: 240);

  static Duration get widgetTransitionDuration => Duration(milliseconds: 120);

  static Curve get animationCurve => Curves.fastOutSlowIn;

  static BorderRadius get popupBorderRadius => BorderRadius.circular(24);
}
