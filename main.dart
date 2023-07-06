import 'package:flutter/material.dart';
import './pages/liste_films.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Films'),
          backgroundColor: Colors.deepOrange,
        ),
        body: ListeFilms(),
      ),
    );
  }
}

