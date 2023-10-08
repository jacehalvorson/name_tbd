import 'package:flutter/material.dart';

enum ColorType {
  text,
  background,
  primary,
  disabledText,
  darkElement,
  darkGray,
}

class ThemeColor {
  static final Map<(ColorType, Brightness), Color> _colorMap = {
    // Dark Theme Colors
    (ColorType.text, Brightness.dark): const Color(0xFFFFFFFF),
    (ColorType.background, Brightness.dark): const Color(0xFF111313),
    (ColorType.primary, Brightness.dark): const Color(0xFF50A2D2),
    (ColorType.disabledText, Brightness.dark): const Color(0xFF616161),
    (ColorType.darkElement, Brightness.dark): const Color(0xFF616161),
    (ColorType.darkGray, Brightness.dark): const Color(0xFF292929),

    // TODO update to the light theme colors we want
    // Light Theme Colors
    (ColorType.text, Brightness.light): const Color(0xFF000000),
    (ColorType.background, Brightness.light): const Color(0xFFFFFFFF),
    (ColorType.primary, Brightness.light): const Color(0xFF0000FF),
    (ColorType.disabledText, Brightness.light): const Color(0xFF888888),
    (ColorType.darkElement, Brightness.light): const Color(0xFF555555),
    (ColorType.darkGray, Brightness.light): const Color(0xFF444444),
  };

  static Color getColor(ColorType themeColor, Brightness brightness) {
    return _colorMap[(themeColor, brightness)] ??
        Colors.black; // Provide a default color if not found
  }
}
