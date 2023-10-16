import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    // prevent to rendering multiple snackbars in the same place
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hello World'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // q NO se cierre con el tab afuera del dialog

      builder: (context) => AlertDialog( // todo buildes de constuye en runtime
        title: const Text('Are you sure?'),
        content: const Text('Aliqua aute consectetur anim enim esse incididunt cillum aliqua dolor elit fugiat dolor. Quis deserunt in consequat id Lorem et et minim. Minim irure commodo qui consequat ea laborum cillum.'),

        actions: [ // .pop()  del go_router para regresar y cerrar el dialog
          TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Accept')),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars & Dialogs')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // licences Flutter dialog
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text('Qui do occaecat tempor ad enim consequat cupidatat id labore culpa adipisicing Lorem. Dolore incididunt nulla duis excepteur. Magna id sint aliqua qui.')
                ]);
              },
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show dialog')
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        // Icon - Widget para icons | Icons - icons como tal
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Show Snackbar'),

        // // Show Snackbar
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
}