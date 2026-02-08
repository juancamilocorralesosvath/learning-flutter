import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

// como es el uso del const?
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("primer elemento"),
              SizedBox(height: 10),
              ElevatedButton(onPressed: null, child: Text("btn")),
              SizedBox(height: 10),
              Text("tercer elemento")
            ],    
          ),
        ),
      )
    );
  }
}