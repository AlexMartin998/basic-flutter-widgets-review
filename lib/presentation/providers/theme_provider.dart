import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';


final isDarkmodePovider = StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);



// // inmutable: Provider - es INMUTABLE
final colorListProvider = Provider((ref) => colorList);
