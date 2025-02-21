import 'package:flutter/material.dart';

class ThemeColor {
  static const Color primaryColor = Color(0xff78d64b);
  static const Color secondaryColor = Color(0xff051c2c);
  static const Color accentColor = Color(0xffeeeeee);
  static const Color backgroundColor = Color(0xfff4f4f4);
  static Color templateColor = Color(0xfff9f9f9);
  static const Color iconColor = Color(0xffbababa);
  static const Color textColor = Color(0xff051c2c);
}

class ButtonColor {
  static const Color primaryColor = ThemeColor.primaryColor;
  static const Color secondaryColor = Color(0xff6cc043);
  static const Color borderColor = ThemeColor.accentColor;
  static const Color textColor = Color(0xffffffff);
}

const MaterialColor customTemplateColor =
    MaterialColor(_customTemplateColorPrimaryValue, <int, Color>{
      50: Color(0xFFFFFBFB),
      100: Color(0xFFFFF7F7),
      200: Color(0xFFFFF2F2),
      300: Color(0xFFFFECEC),
      400: Color(0xFFFFE7E7),
      500: Color(_customTemplateColorPrimaryValue),
      600: Color(0xFFF2F2F2),
      700: Color(0xFFE6E6E6),
      800: Color(0xFFD9D9D9),
      900: Color(0xFFCCCCCC),
    });

const int _customTemplateColorPrimaryValue = 0xFFF9F9F9;

const MaterialColor customTemplateTextColor =
    MaterialColor(_customTemplateTextColorPrimaryValue, <int, Color>{
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CAE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7986CB),
      400: Color(0xFF5C6BC0),
      500: Color(_customTemplateTextColorPrimaryValue),
      600: Color(0xFF3949AB),
      700: Color(0xFF303F9F),
      800: Color(0xFF283593),
      900: Color(0xFF1A237E),
    });

const int _customTemplateTextColorPrimaryValue = 0xFF051C2C;
