import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navegación Avanzada',
      home: HomeScreen(),
    );
  }
}

// --- Pantalla Principal ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selection = "Aún no has elegido.";

  // Método para navegar y esperar un resultado
  Future<void> _navigateToSelectionScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    // Si hay un resultado, actualizamos el estado
    if (result != null) {
      setState(() {
        _selection = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_selection, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToSelectionScreen(context),
              child: const Text('Abrir pantalla de selección'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Pantalla de Selección ---
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige una opción'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Devolver 'Opción A' como resultado
                Navigator.pop(context, 'Has elegido la Opción A');
              },
              child: const Text('Opción A'),
            ),
            ElevatedButton(
              onPressed: () {
                // Devolver 'Opción B' como resultado
                Navigator.pop(context, 'Has elegido la Opción B');
              },
              child: const Text('Opción B'),
            ),
          ],
        ),
      ),
    );
  }
}