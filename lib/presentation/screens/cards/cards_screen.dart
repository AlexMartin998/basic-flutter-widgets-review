import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];


class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),

      body: const _CardsView() ,
    );
  }


}



class _CardsView extends StatelessWidget {
  const _CardsView();


  @override
  Widget build(BuildContext context) {

    // Permite el Scroll en 1 unico hijo para cuando se Desborde el contenido
    return SingleChildScrollView(
      child: Column(

        children: [
          // spread del iterable q retorna el map para q se aplane en el []
          ...cards.map((card) => _CardType1(  // return iterable y aqui si podemos W con ellos
            label: card['label'],
            elevation: card['elevation']
          )),

          ...cards.map((card) => _CardType2(
            label: card['label'],
            elevation: card['elevation']
          )),

          ...cards.map((card) => _CardType3(
            label: card['label'],
            elevation: card['elevation']
          )),

          ...cards.map((card) => _CardType4(
            label: card['label'],
            elevation: card['elevation']
          )),


          // dar margin para q se vea bien el ultimo
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}



class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation
  });


  @override
  Widget build(BuildContext context) {
    return Card( // card widget propio de flutter
      elevation: elevation,

      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),

        child: Column(
          children: [
            Align( // alinear el widget
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}



class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation
  });


  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Card( // card widget propio de flutter
      elevation: elevation,
      shape: RoundedRectangleBorder(  // Style al border
        side: BorderSide(color: color.outline),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),

      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),

        child: Column(
          children: [
            Align( // alinear el widget
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            ),
          ],
        ),
      ),
    );
  }
}



class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation
  });


  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Card( // card widget propio de flutter
      elevation: elevation,
      color: color.surfaceVariant,

      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),

        child: Column(
          children: [
            Align( // alinear el widget
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            ),
          ],
        ),
      ),
    );
  }
}



class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation
  });


  @override
  Widget build(BuildContext context) {
    return Card( // card widget propio de flutter
      elevation: elevation,
      // like ClipRRect para evitar q los childs se salgan del parent (rounded)
      clipBehavior: Clip.hardEdge,

      child: Stack( // 1 sobre otro en orden
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover, // como se adapta la img
          ),


          Align( // alinear el widget
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),

              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined)),
            ),
          ),
        ],
      ),
    );
  }
}


