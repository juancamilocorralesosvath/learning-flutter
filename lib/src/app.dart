import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo Botones',
      home: Scaffold(
        appBar: AppBar(title: const Text('Widgets Button')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  print('ElevatedButton presionado!');
                },
                child: const Text('Botón Elevado'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  print('TextButton presionado!');
                },
                child: const Text('Botón de Texto'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  print('OutlinedButton presionado!');
                },
                child: const Text('Botón con Borde'),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  print('IconButton presionado!');
                },
                color: Colors.blue,
                iconSize: 40.0,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  print('ElevatedButton.icon presionado!');
                },
                icon: const Icon(Icons.add),
                label: const Text('Añadir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}