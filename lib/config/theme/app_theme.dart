import 'package:flutter/material.dart';

const List<Color> _colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];


class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor <= _colorList.length - 1 && selectedColor >= 0, 'Invalid index color');


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _colorList[selectedColor],
    appBarTheme: const AppBarTheme(  // config de todos los appbars
      centerTitle: false
    )
  );
}
