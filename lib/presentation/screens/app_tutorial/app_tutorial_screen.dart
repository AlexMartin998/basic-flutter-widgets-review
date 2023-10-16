import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  // args posicionales
  SlideInfo(this.title, this.caption, this.imageUrl);

}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Anim eiusmod amet deserunt Lorem laborum voluptate do.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Excepteur tempor commodo do excepteur.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'In qui ex adipisicing pariatur consectetur sint sunt ipsum non.', 'assets/images/3.png'),
];



// statefull para el Control del PageView y saver el last slide
class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}


class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController(); // conoce todo del PageView
  bool endReached = false;


  // // lifecycle
  @override
  void initState() {
    super.initState(); // 100pre se lo llama al inicio del method

    // // listeners: se llaman 1 monton de veces, dependiendo la taza de refresco
    // con n/movimiento del la pantalla va de 0.01 en 0.01. x eso NO colocar upd de state aqui
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      
      if (!endReached && page >= (slides.length - 1.5)) {
        // cuidado con llamar a los setState q hacen UPD del state en inits y en listeners
        setState(() {
          endReached = true;
        });
      }
      
    });
  }

  @override
  void dispose() {  // ngOnDestroy :v
    super.dispose();

    // obligatorio dispose de todo controller/listener q creemos
    pageViewController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(  // page
      backgroundColor: Colors.white,
      
      body: Stack( // algo sobre algo q respeta el orden :v
        children: [
          PageView(  // ocupa toda la page. x default slide Horizontal 
            physics: const BouncingScrollPhysics(),  // tener el mismo rebote en ios/android

            // // controller: ver el ultimo slide
            controller: pageViewController,

            children: slides.map(
              (slide) => _Slide(
                title: slide.title,
                caption: slide.caption,
                imageUrl: slide.imageUrl
              )
            ).toList(),
          ),

          // exist btn
          Positioned(
            right: 21,
            top: 48,
            child: TextButton(
              child: const Text('Exit'),
              onPressed: () => context.pop() // go_router: go back
            ),
          ),

          // continue btn
          endReached ? 
            Positioned(
              bottom: 30,
              right: 30,

              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 420),
                child: FilledButton(
                  child: const Text('Start'),
                  onPressed: ()=>context.pop(),
                ),
              ),
            )
            : const SizedBox(), // para no renderizar nada
        ],
      ),
    );
  }
}



class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({required this.title, required this.caption, required this.imageUrl});


  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // y-center <- column
        crossAxisAlignment: CrossAxisAlignment.start, // x-start  <- column

        children: [
          // Image(image: AssetImage(imageUrl)),
          Image.asset(imageUrl),
          const SizedBox(height: 21),

          Text(title, style: titleStyle,),
          const SizedBox(height: 12),

          Text(caption, style: captionStyle),
        ]
      ),
    );
  }
}