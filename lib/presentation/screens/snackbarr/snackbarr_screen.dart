import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(context) {
    final snackbar = SnackBar(
      content: const Text('Fucking World'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Est elit irure officia reprehenderit consectetur eiusmod mollit eu reprehenderit. Est culpa laborum occaecat quis nostrud pariatur id est non. Consectetur aliquip consequat aute aute consectetur incididunt labore velit elit ut enim id minim. Do ipsum occaecat velit in mollit pariatur elit occaecat reprehenderit.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),

           FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Consectetur consectetur commodo in culpa excepteur aliquip veniam qui est anim anim. Occaecat tempor eiusmod anim sit adipisicing aliqua voluptate laboris duis. Occaecat eu occaecat et qui dolor et amet. Id eiusmod amet laborum ut sunt qui.'),
                        
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Mostrar Dialogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
