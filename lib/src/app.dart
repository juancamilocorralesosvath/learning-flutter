import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget que configura el tema, el titulo y la pantalla inicial
    return MaterialApp(
      title: 'First app',
      home: Scaffold(
        appBar: AppBar(title: const Text("ejemplo container"),),
        body: Center(
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                "hello container!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),    
          ),
        ),
      )
    );
  }
}