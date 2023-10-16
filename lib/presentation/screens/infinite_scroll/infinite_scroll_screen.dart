import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}



class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  List<int> sizePage = [1, 2, 3, 4, 5];

  bool isLoading = false;
  final ScrollController scrollController = ScrollController();
  
  // // lifecycle
  @override
  void initState() {
    super.initState();

    // // como es 1 listener, corre esto 1 monton de veces y es NORMAL
      // tener cuidado con re-render, tener flags de salvaguarda como isLoading en este caso
    scrollController.addListener(() {
      // scrollController.position.pixels   // curent pixel 
      // scrollController.position.maxScrollExtent  // final

      // flutter hara las evaluiaciones cada rato (0.001) y es NORMAL y flutter es Eficiente al hacerlo
        // como NOO estamos re-renderizando nada con UPD state, esto NO tiene impacto en el rendimiento app
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
  

  Future loadNextPage() async {
    if (isLoading) return; // para evitar muchas llamadas en el Listener
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    // // widget is mounted? si me salgo y se quita el widget del Context, como es Async luego hara UPD state de algo q ya no existe y daria errores q cerrarian la app
    if(!mounted) return;  // x dafault hace ref al widget

    setState(() {});

    // scroll to botton when loading is completed
    moveScrollToBotton();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll(
      sizePage.map((e) => lastId + e)
    );

  }

  // // Pull Refresh
  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    if(!mounted) return;

    final lastId = imagesIds.last;
    imagesIds.clear(); // resetea el List
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
    isLoading = false;
  }

  // // mover en auto el scroll hacia abajo para mostrar q hay mas imgs cargadas
  void moveScrollToBotton() {
    // solo cuando esta cerca del final hago el scroll
    if (scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, // offset pa q vaya al mx q el scroll puede dar abajo
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black87,

      // remover el padding del listview. Como no se W con AppBar, se debe gestionarlo
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,


        child: RefreshIndicator(  // pull refresh de toda la vida
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,

          // // builder construye en runtime bajo demanda
          child: ListView.builder(
            // req controller para el infinitscroll: 
            controller: scrollController, // binding scrollcontroller con este listview
        
            itemCount: imagesIds.length,
              
            itemBuilder: (context, index) {
              // permite mostrar el placeholder mientras se carga la img
              return FadeInImage(
                fit: BoxFit.cover, // fit de ajuste de la image como en web con css
                width: double.infinity,
                height: 300,
              
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300'),
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: !isLoading 
          ? FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))
          : const CircularProgressIndicator(),
      ),
    );
  }
}