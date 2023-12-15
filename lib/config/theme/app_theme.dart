import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F); // #00FF00

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedTheme;

  AppTheme({this.selectedTheme = 0})
      : assert(selectedTheme >= 0 && selectedTheme < _colorThemes.length,
            'Color must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedTheme],
    );
  }
}
