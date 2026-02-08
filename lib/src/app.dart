import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo Image Widget',
      home: Scaffold(
        appBar: AppBar(title: const Text('Widget Image')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Imagen desde Internet:'),
              const SizedBox(height: 10),
              Image.network(
                'https://yt3.googleusercontent.com/2__G-ckA66-4JgXPlHTGZvg8CoUIgDU6qYFnJqW-AsVeJvBRT4hCjXz4XMOjIqm4m7v431lT=s900-c-k-c0x00ffffff-no-rj',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30),
              const Text('Imagen desde Assets:'),
              const SizedBox(height: 10),
              Image.asset(
                'assets/logo.jpg', 
                width: 200, 
                height: 200
              ),
            ],
          ),
        ),
      ),
    );
  }
}