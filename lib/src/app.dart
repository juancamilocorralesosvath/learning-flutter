import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

// como es el uso del const?
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget que configura el tema, el titulo y la pantalla inicial
    return MaterialApp(
      title: 'simple counter',
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0; // estado mutable

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // esto que significa?
          children: <Widget>[
            Text(
              '$_counter', 
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            ElevatedButton(onPressed: _incrementCounter, child: const Text('increment')),
          ],
        ),
      ),
    );
  }
}