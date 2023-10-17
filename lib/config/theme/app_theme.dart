import 'package:flutter/material.dart';

const List<Color> colorList = [
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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
  }) : assert(selectedColor <= colorList.length - 1 && selectedColor >= 0, 'Invalid index color');


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,  // dark mode

    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(  // config de todos los appbars
      centerTitle: false
    )
  );
}
