import 'dart:math' show Random; // solo trae esa libreria
import 'package:flutter/material.dart';


class AnimatedScreen extends StatefulWidget { // tiene Lifecyle y state
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}



class _AnimatedScreenState extends State<AnimatedScreen> {
  
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadious = 10.0;


  void changeShape() {
    // // random in dart
    final random = Random();

    // prevent negative values
    width = random.nextInt(309) + 50; // min=50
    height = random.nextDouble() * 420 + 50.0;
    borderRadious = random.nextDouble() * 100 + 10;

    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1
    );

    // actualiza el state y dispara re-renders en donde se requiera
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Contanier'),
      ),

      body: Center(
        
        // // AnimatedContainer: permite animaciones faciles al cambio de alguna property
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 420),
          curve: Curves.easeOut, // tipo de Animacion

          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadious)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }

}