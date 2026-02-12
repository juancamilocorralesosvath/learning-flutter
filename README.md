# hello_world

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

* flutter pub get --> instalar dependencias

preguntas:

1. por que hay cosas que empiezan con _?
2. por que se hace asi: fontWeight: FontWeight.bold
3. la seccion de textfield: autzilio
4. input decoration no tiene ejemplo

## ojo
para poder usar imagenes hay que ir al archivo pubspec.yaml
y en la seccion flutter agregar la clave assets:

```bash
flutter:
  assets:
    - assets/
```

luego crear la carpeta assets en la raiz del proyecto, colocar imagenes 

y por ultimo ejecutar 
`flutter pub get`

### navegacion
la mejor manera es usar rutas nombradas
```bash
MaterialApp(
  // La ruta inicial de la app será la que tenga '/'
  initialRoute: '/',
  routes: {
    '/': (context) => LoginScreen(),
    '/main': (context) => MainScreen(),
  },
);
```

para navegar se usa navigator.pushNamed:
```bash
// En el onPressed del botón de login:

onPressed: () {
  Navigator.pushNamed(context, '/main');
}
```

Limpiar el historial de navegacion: esto es para cuando queremos que el usuario navegue pero no pueda volver atras, como en un inicio de sesion exitoso. para eso usarmos `Navigator.pushNamedAndRemoveUntil`. Este método no solo nos lleva a una nueva pantalla, sino que también elimina las anteriores según una condición que nosotros definimos.

```bash
// Ejemplo: Navegar desde Login a Home, eliminando la pantalla de Login del historial.
onPressed: () {
  Navigator.pushNamedAndRemoveUntil(
    context,
    '/home', // La nueva ruta a la que navegamos
    (Route<dynamic> route) => false, // Condición para eliminar las rutas anteriores
  );
}
```
cuando en la funcion devolvemos false, todas las rutas anteriores son eliminadas

#### pasar argumentos 

para enviar datos de una pantalla a otra: `Navigator.pushNamed`

```bash
// Enviando un String simple como argumento
onPressed: () {
  Navigator.pushNamed(
    context,
    '/details',
    arguments: 'Hola desde la pantalla de inicio',
  );
}
```
para acceder a los datos: ModalRoute

```bash
// En el método build de la pantalla de detalles (DetailsScreen)

@override
Widget build(BuildContext context) {
  // Extraemos los argumentos
  final String message = ModalRoute.of(context)!.settings.arguments as String;

  return Scaffold(
    appBar: AppBar(
      title: const Text('Pantalla de Detalles'),
    ),
    body: Center(
      child: Text(message), // Mostramos el mensaje recibido
    ),
  );
}
```

#### Pasar Argumentos con un Objeto Personalizado
1. crear una clase 
para asegurar consistencia y seguridad
```bash
// Un objeto simple para pasar como argumento
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
```
2. se envia el objeto: 
```bash
// Navegar y pasar el objeto ScreenArguments
onPressed: () {
  Navigator.pushNamed(
    context,
    '/details',
    arguments: ScreenArguments(
      'Título Personalizado',
      'Este es un mensaje desde un objeto.',
    ),
  );
}
```
3. recibir el objeto
```bash
// En la pantalla de detalles
@override
Widget build(BuildContext context) {
  final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

  return Scaffold(
    appBar: AppBar(
      title: Text(args.title), // Usamos el título del objeto
    ),
    body: Center(
      child: Text(args.message), // Usamos el mensaje del objeto
    ),
  );
}
```

#### Devolver Datos de una Pantalla
En la pantalla principal, cuando navegamos a la pantalla de selección, usamos await para pausar la ejecución y esperar a que la pantalla de selección se cierre y devuelva un valor.
```bash
// En la pantalla principal, dentro de un método async

Future<void> _navigateAndDisplaySelection(BuildContext context) async {
  // Esperamos el resultado de la pantalla de selección.
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SelectionScreen()),
  );

  // Después de que la pantalla de selección devuelve un resultado,
  // ¡actualizamos la UI!
  if (context.mounted && result != null) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

```

devolver el resultado

navigator.pop para cerrar la pantalla y pasar el resultado de vuelta

```bash
// En la pantalla de selección, dentro de los botones

// Botón "Sí"
ElevatedButton(
  onPressed: () {
    // Cierra la pantalla y devuelve "¡Sí!" como resultado.
    Navigator.pop(context, '¡Sí!');
  },
  child: const Text('¡Sí!'),
)

// Botón "No"
ElevatedButton(
  onPressed: () {
    // Cierra la pantalla y devuelve "¡No!" como resultado.
    Navigator.pop(context, '¡No!');
  },
  child: const Text('¡No!'),
)
```

### Navegacion con BottomNavigationBar
para implementarla necesitamos un stateful widget que gestione el estado de la pestaña seleccionada.
Cada `BottomNavigationBarItem` representa una pestaña: 

```bash
Scaffold(
  appBar: AppBar(
    title: const Text('BottomNavBar Demo'),
  ),
  body: // Aquí irá la pantalla seleccionada,
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Negocios',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'Escuela',
      ),
    ],
  ),
);
```
#### Manejo del estado y la interaccion
necesitamos tres cosas: 
1. almacenar el indice de la pestaña actual
2. lista de widgets (pantallas) a mostrar
3. funcion a ejecutar cuando el user toque una pestaña

```bash
int _selectedIndex = 0; // Índice de la pestaña activa

// Lista de pantallas que se mostrarán
static const List<Widget> _widgetOptions = <Widget>[
  Text('Index 0: Inicio'),
  Text('Index 1: Negocios'),
  Text('Index 2: Escuela'),
];

// Función para cambio de pestaña
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
```

conectando las cosas: 

```bash
Scaffold(
  appBar: AppBar(
    title: const Text('BottomNavBar Demo'),
  ),
  body: Center(
    child: _widgetOptions.elementAt(_selectedIndex), // Muestra la pantalla seleccionada
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Negocios',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'Escuela',
      ),
    ],
    currentIndex: _selectedIndex, // Resalta la pestaña activa
    selectedItemColor: Colors.amber[800], // Color del ítem seleccionado
    onTap: _onItemTapped, // Llama a la función al dar click
  ),
);
```