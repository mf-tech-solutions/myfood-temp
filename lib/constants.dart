import 'package:flutter/material.dart';

class Constants {
  static Color get primaryColor => Colors.pink;

  static Color get accentColor => Colors.pinkAccent[400];

  static Color get scaffoldBackgroundColor => Color(0xFFF4F4F4);

  static String get loremIpsum =>
      'Enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et';

  static Duration get pageTransitionDuration => Duration(milliseconds: 240);

  static Duration get widgetTransitionDuration => Duration(milliseconds: 120);

  static Curve get animationCurve => Curves.fastOutSlowIn;

  static BorderRadius get popupBorderRadius => BorderRadius.circular(24);
}
