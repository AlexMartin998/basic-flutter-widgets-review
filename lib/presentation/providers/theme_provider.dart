import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';



// // stateprovider: mantener Piezas pequenias de State
final isDarkmodePovider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider((ref) => 0);



// // inmutable: Provider - es INMUTABLE
final colorListProvider = Provider((ref) => colorList);







// // // StateNotifierProvider: Para Objects Mas complejos   --    AppTheme CUSTOM object 
// ThemeNotifier = class encargada d MANEJAR el State | de la Class Personalizada: AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(), // la 1ra instancia
);


// Controller or notifier: Mantiene 1 State en particular (AppTheme)
class ThemeNotifier extends StateNotifier<AppTheme> {

  // crear la 1ra   INSTANCIA   del AppTheme   <---   STATE = new AppTheme()
  ThemeNotifier() : super(AppTheme()); // super setea el initi state (must be sycn)
  

  // // Como esta es la Class q MANJEA/CONTROLA/HANDLER el state podetemos tener methods utiles
  // sabe todo sobre el <AppTheme>

  // state: tiene acceso a todas las props del AppTheme
  void toggleDarkMode() {
    // riverpod detecta el cambio del state y NOTIFICA en auto para q se hagan re-renders 
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }

  // como solo hace ref a la Class AppTheme, los COLORS no son parte directa, x eso no los manejamos aqui

}

