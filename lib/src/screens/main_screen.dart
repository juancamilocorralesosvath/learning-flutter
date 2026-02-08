import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // estructura visual basica para una pantalla
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla principal')),
      body: const Center(child: Text('¡Bienvenido a tu primera app Flutter!')),
    );
  }
}