import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

// como es el uso del const?
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget que configura el tema, el titulo y la pantalla inicial
    return MaterialApp(
      title: 'ejemplo mix',
      home: Scaffold(
        appBar: AppBar(title: const Text("barra de iconos")),
        body: Container(
          color: Colors.black,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildButtonColumn(Icons.call, 'Llamar'),
              _buildButtonColumn(Icons.near_me, 'Ruta'),
              _buildButtonColumn(Icons.share, 'Compartir'),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(height: 8), // espacio entre icon y text
        Text(
          label, 
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.blue
          ),
        ),
      ],
    );
  }
}
