import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';


class HomeScreen extends StatelessWidget {
  // naming routes
  static const String name = 'home_screen';

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),

      body: const _HomeView(),
    );
  }
}


class _HomeView extends StatelessWidget {
  // si es private va a tener 1 unica ref, asi q no necesita key
  const _HomeView();


  @override
  Widget build(BuildContext context) {

    return ListView.builder(  // .builder: construye en runtime
      itemCount: appMenuItems.length,

      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}


class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItem menuItem;


  @override
  Widget build(BuildContext context) {
    // get color theme
    final color = Theme.of(context).colorScheme;

    return ListTile( // tile especializado en Lists: 
      leading: Icon(menuItem.icon, color: color.primary), // leading espacio antes del tile
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),

      onTap: () {
        // // // navigation: si tenemos Appbar, en auto coloca el btn de retroceder

        // // go_router: extiende el context de la app, x eso podemos usar el   .push
        context.push(menuItem.link);
        // context.pushNamed(CardsScreen.name); // requeriri mas config en el menu item y demas para q sea dinamico



        // // sistema de rutas propias de flutter:
        // Navigator WITHOUT naming | push: hace 1 Stack de pantallas (1 sobre otra)
        /* Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen(),
          ),
        ); */

        // Named routes (limitations)
        // Navigator.pushNamed(context, menuItem.link);
      },
      
    );
  }
}