import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo TextField Widget',
      home: MyTextFieldScreen(),
    );
  }
}

class MyTextFieldScreen extends StatefulWidget {
  const MyTextFieldScreen({super.key});

  @override
  State<MyTextFieldScreen> createState() => _MyTextFieldScreenState();
}

class _MyTextFieldScreenState extends State<MyTextFieldScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre Completo',
                hintText: 'Escribe tu nombre aquí',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                print('Nombre: $text');
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                hintText: 'ejemplo@dominio.com',
                suffixIcon: Icon(Icons.email),
                helperText: 'Introduce un correo válido',
                border: UnderlineInputBorder(),
              ),
              onChanged: (text) {
                print('Email: $text');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Datos Ingresados'),
                    content: Text(
                      'Nombre: ${_nameController.text}\nEmail: ${_emailController.text}',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Mostrar Datos'),
            ),
          ],
        ),
      ),
    );
  }
}