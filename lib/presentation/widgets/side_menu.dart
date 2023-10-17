import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';


class SideMenu extends StatefulWidget {
  // scaffold ref para cerrar el drawer tras navegacion
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});


  @override
  State<SideMenu> createState() => _SideMenuState();
}


class _SideMenuState extends State<SideMenu> {
  // me permitira saber la opt selected del menu lateral
  int navDrawerIndex = 0;


  @override
  Widget build(BuildContext context) {
    // nos da el padding top del dispositivo, en base a esto determinamos el Notch
    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 36;


    return NavigationDrawer( // menu lateral
      selectedIndex: navDrawerIndex, // menu item selected

      onDestinationSelected: (value) { // value es el index seleccinado (menu item)
        setState(() { navDrawerIndex = value; });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link); // go_router

        // acceder a las props del Widget through its state
        widget.scaffoldKey.currentState?.closeDrawer();
      },


      children: [
        // // dar padding top basado en la presencia del Notch para uniformizar design
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 26, 10),
          child: const Text('Main menu', style: TextStyle(fontSize: 15)),
        ),

        ...appMenuItems
          .sublist(0, 3) // like slice
          .map((menutItem) => NavigationDrawerDestination(
            icon: Icon(menutItem.icon),
            label: Text(menutItem.title)
          )),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        // post-divider
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 20, 26, 10),
          child: Text('More options', style: TextStyle(fontSize: 15)),
        ),

        ...appMenuItems
          .sublist(3) // like slice
          .map((menutItem) => NavigationDrawerDestination(
            icon: Icon(menutItem.icon),
            label: Text(menutItem.title)
          )),

      ],
    );
  }

}
