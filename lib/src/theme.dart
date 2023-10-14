import 'package:flutter/material.dart';

// Color scheme has been changed. Here is a mapping between
// the names of the old colors to the names of the new colors:

// text => onBackground
// disabledText => secondary
// darkElement => seconday
// darkGray => tertiary

// Note: The actual colors haven't changed, just the names

const darkColorScheme = ColorScheme.dark(
  background: Color(0xFF111313),
  onBackground: Color(0xFFFFFFFF),
  primary: Color(0xFF50A2D2),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF616161),
  tertiary: Color(0xFF292929),
);

const lightColorScheme = ColorScheme.light(
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF000000),
  primary: Color(0xFF0000FF),
  onPrimary: Color(0xFF000000),
  secondary: Color(0xFF616161),
  tertiary: Color(0xFFE0E0E0),
);
