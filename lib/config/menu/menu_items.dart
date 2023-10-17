import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' show IconData; // specific package

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  // const xq no van a cambiar una vez instanciado (amenos copywith)
  const MenuItem({
    required this.title, required this.subtitle, required this.link, required this.icon
  });
}


const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Riverpod Counter',
    subtitle: 'Counter Screen',
    link: '/counter',
    icon: Icons.add
  ),

  MenuItem(
    title: 'Buttons',
    subtitle: 'Several buttons in flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Cards',
    subtitle: 'Stylized container',
    link: '/cards',
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'General & controlated',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars & Dialog',
    subtitle: 'Indicators on Screen',
    link: '/snackbars',
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated Container',
    subtitle: 'Animated Statefull Widget',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItem(
    title: 'UI Controls + Tiles',
    subtitle: 'Flutter controls',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: 'App tutorial',
    subtitle: 'Introduction',
    link: '/tutorial',
    icon: Icons.library_books_sharp
  ),

  MenuItem(
    title: 'Infinite Scroll & Pull Refresh',
    subtitle: 'Get infinite images',
    link: '/infinite',
    icon: Icons.list_alt_rounded
  ),
];
