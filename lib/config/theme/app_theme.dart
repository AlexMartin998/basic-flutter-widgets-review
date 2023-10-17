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




  // // riverpod - state notifier: Para mantener las props como final retornamos 1 instancia de classe q nos permita mutar el state basado en el state anterior

  // mantener state inmutable. Si cambia algo en el state, Creamos 1 nuevo state basado en el anterior <- esencia del copyWith() muy usado en la vida real
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  }) => AppTheme(
    // como es opt, si no me lo envia uso el q tengo en la class
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );

}
