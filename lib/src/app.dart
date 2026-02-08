import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

// como es el uso del const?
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget que configura el tema, el titulo y la pantalla inicial
    return MaterialApp(
      title: 'ejemplo row',
      home: Scaffold(
        appBar: AppBar(title: const Text("ejemplo row"),),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("elemento A"),
              
              ElevatedButton(onPressed: null, child: Text("btn")),
              
              Text("elemento b")
            ],    
          ),
        ),
      )
    );
  }
}