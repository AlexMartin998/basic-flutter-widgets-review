import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),


      body: const _ButtonsView() ,

      // // btn flotante q se colaba al right/button
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();  // retrocede al prev route
        },
      ),
    );
  }
}



class _ButtonsView extends StatelessWidget {
  const _ButtonsView();


  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    
        child: Wrap( // 
          spacing: 10,
          alignment: WrapAlignment.center,
    
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
    

            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.access_alarm_outlined), label: const Text('Elevated Icon')
            ),


            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.accessibility_new_outlined),
              label: const Text('Filled Icon')
            ),
          

            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.terminal_outlined),
              label: const Text('Outine Icon'),
            ),


            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.forest_outlined),
              label: const Text('TextIcon'),
            ),


            // TODO: custom button


            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration)),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.app_registration),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)
              ),
            ),

          ],
        ),
      ),
    );
  }
}