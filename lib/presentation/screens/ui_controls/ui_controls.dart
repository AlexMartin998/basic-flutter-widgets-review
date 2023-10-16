import 'package:flutter/material.dart';


class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),

      body: _UiControlsView(),
    );
  }
}



class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}



enum Transportation {car, plane, boat, submarine}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreackfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;


  @override
  Widget build(BuildContext context) {

    return ListView(  // nos da la lista de una, no la construye bajo demanda en runtime
      physics: const ClampingScrollPhysics(), // remove rebote de ios
      
      children: [
        // // ListTile para q toda la fila sea seleccionable
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Additional Controls'),

          value: isDeveloper, 
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          })
        ),


        // // Agrupa Opts y Permite colapsarlas
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),

          children: [
            // // select (one)
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar x carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar x barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar x avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar x submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
      
      
        // // Check box
        CheckboxListTile(
          title: const Text('Do yo want something for breackfast?'),
          value: wantsBreackfast,
          onChanged: (value) => setState(() {
            wantsBreackfast = !wantsBreackfast;
          }),
        ),

        CheckboxListTile(
          title: const Text('Do yo want something for lunch?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Do yo want something for dinner?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
