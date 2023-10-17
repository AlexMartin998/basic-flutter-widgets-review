import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    // riverpod sabra donde buscar c/provider q generemos
    const ProviderScope( // provider de Riverpod
      child: MainApp(),
    )
  );
}


class MainApp extends ConsumerWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Riverpod
    final bool isDarkmode = ref.watch(isDarkmodePovider);
    final int selectedColor = ref.watch(selectedColorProvider);


    // // routing with   `go_router`:   .router()
    return MaterialApp.router(
      routerConfig: appRouter, // nuestro router

      title: 'Flutter Widgets',
      debugShowCheckedModeBanner: false,

      theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkmode).getTheme(),

      /* // // routes: Using NAMED routes. No permite pasar Args
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      }, */
    );
  }
}
