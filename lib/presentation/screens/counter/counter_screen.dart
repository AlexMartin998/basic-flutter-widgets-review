import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';


// consumewidget para stateless widgets
class CounterScreen extends ConsumerWidget {
  static const String name = 'coutner_screen';

  const CounterScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) { // ref para ref al provider
    // // riverpod
    // watch: escuchar cambios/upds y re-renderizar cuando cambie. Pendiente d los cambios
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkmodePovider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: (){
              ref.read(isDarkmodePovider.notifier).state = !isDarkMode;
            }
          )
        ],
      ),


      body: Center(
        child: Text('Value $clickCounter', style: Theme.of(context).textTheme.titleLarge),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: (){
          // // upd value of riverpod state: read para solo leer y no pendiente changes
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }

}
