import 'package:flutter/material.dart';
import 'package:lab2/screens/jokes_list.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes_list': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return JokesList(type: args);
        },
        // '/random': (context) => RandomJokeScreen(),
      },
    );
  }
}
