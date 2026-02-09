import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScaffoldMessenger Demo',
      home: Builder(
        // Builder es necesario para obtener un contexto que tenga un Scaffold
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('ScaffoldMessenger Demo')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('¡SnackBar simple!'),
                      ),
                    );
                  },
                  child: const Text('Mostrar SnackBar Simple'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Elemento eliminado.'),
                        action: SnackBarAction(
                          label: 'Deshacer',
                          onPressed: () {
                            print('Acción deshecha!');
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text('Mostrar SnackBar con Acción'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text('¡Este es un nuevo mensaje!')),
                      );
                  },
                  child: const Text('Reemplazar SnackBar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}