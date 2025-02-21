import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHelper {
  static IconData getIconData(String iconName) {
    final icons = {
      'email': FontAwesomeIcons.envelope,
      'password': FontAwesomeIcons.lock,
      'search': FontAwesomeIcons.magnifyingGlass,
      'user': FontAwesomeIcons.user,
      'back': FontAwesomeIcons.arrowLeft,
      'menu': FontAwesomeIcons.bars,
    };

    return icons[iconName] ?? FontAwesomeIcons.question;
  }
}

class CustomIcon {
  static const email = 'email';
  static const password = 'password';
  static const search = 'search';
  static const user = 'user';
  static const back = 'back';
  static const menu = 'menu';
}
