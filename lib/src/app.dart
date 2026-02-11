import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de Navegación',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}

// Pantalla de Inicio
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Inicio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar a la pantalla de detalles
            Navigator.pushNamed(context, '/details');
          },
          child: const Text('Ir a Detalles'),
        ),
      ),
    );
  }
}

// Pantalla de Detalles
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Detalles'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Regresar a la pantalla de inicio
            Navigator.pop(context);
          },
          child: const Text('Volver al Inicio'),
        ),
      ),
    );
  }
}