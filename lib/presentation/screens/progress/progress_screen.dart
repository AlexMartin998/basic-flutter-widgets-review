import 'package:flutter/material.dart';


// with go_router it also works on web
class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),

      body: const _ProgressView(),
    );
  }
}



class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular prodress indicator', style: TextStyle(fontSize: 16)),
          SizedBox(height: 12),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black38),

          SizedBox(height: 42),
          Text('Progress indicator controlado - Optimistic Update?', style: TextStyle(fontSize: 16)),
          _ControlledPorgressIndicator()

        ],
      )
    );
  }
}



class _ControlledPorgressIndicator extends StatelessWidget {
  const _ControlledPorgressIndicator();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(  // se encarga en auto del   despose/destroy   del stream
      // periodic para simular el loding
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value <= 1),

      builder: (context, snapshot) { // snapshot sabe el value q emite el Stream
        final progressValue = snapshot.data ?? 0; 

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue ,strokeWidth: 2, backgroundColor: Colors.black12),
              const SizedBox(width: 20),
    
              // toma todo el espacio del Parent
              Expanded(
                child: LinearProgressIndicator(value: progressValue), // row NO le da size fijo, sin expanded da error
              )
            ],
          ),
        );
      }
    );
  }
}