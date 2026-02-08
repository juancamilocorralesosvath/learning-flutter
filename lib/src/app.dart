import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo SingleChildScrollView',
      home: Scaffold(
          appBar: AppBar(title: const Text('Widget SingleChildScrollView')),
          body: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Habilita el scroll horizontal
          child: Row(
            children: [
              // Tus widgets aquí
              Container(width: 200, height: 100, color: Colors.red),
              Container(width: 200, height: 100, color: Colors.green),
              Container(width: 200, height: 100, color: Colors.blue),
              Container(width: 200, height: 100, color: Colors.black),
            ],
          ),
        )
      ),
    );
  }
}