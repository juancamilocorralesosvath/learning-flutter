import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget que configura el tema, el titulo y la pantalla inicial
    return MaterialApp(
      title: 'First app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}