import 'package:flutter/material.dart';

class ColorPalette {
  Map<int, Color> color = {
    50: const Color.fromRGBO(51, 153, 255, .1),
    100: const Color.fromRGBO(51, 153, 255, .2),
    200: const Color.fromRGBO(51, 153, 255, .3),
    300: const Color.fromRGBO(51, 153, 255, .4),
    400: const Color.fromRGBO(51, 153, 255, .5),
    500: const Color.fromRGBO(51, 153, 255, .6),
    600: const Color.fromRGBO(51, 153, 255, .7),
    700: const Color.fromRGBO(51, 153, 255, .8),
    800: const Color.fromRGBO(51, 153, 255, .9),
    900: const Color.fromRGBO(51, 153, 255, 1),
  };

  static const Color primaryColor = Color(0xFF2cadad);
  static const Color whiteColor = Color(0xFFf0f0f0);
  static const Color hintColor = Color(0xFFbdbdbd);
  static const Color titleColor = Color(0xFF515151);
  static const Color subtitleColor = Color(0xFF9e9e9e);
  static const Color iconBgColor = Color(0xFFf3f3f3);
}
