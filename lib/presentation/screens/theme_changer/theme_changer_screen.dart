import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // // without StateNotifier
    // final bool isDarkMode = ref.watch(isDarkmodePovider);

    // // with StateNotifier
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),

        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),

            onPressed: () {
              // // without StateNotifier
              // ref.read(isDarkmodePovider.notifier).state = !isDarkMode;

              // // with StateNotifier
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          )
        ],
      ),

      body: const _ThemeChangerView(),
    );
  }
}



class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // pese a q es constante e inmutable, riverpod recomienda usar watch en este caso
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);


    return ListView.builder(
      itemCount: colors.length,
      
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('This color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,

          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            // upd selected color state provider
            ref.read(selectedColorProvider.notifier).state = value!;

            // notify change to re-render and upd state
          }
        );
      },
    );
  }
}

