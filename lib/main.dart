import 'package:flutter/material.dart';
import 'package:flutter_libraries_playground/di/injector.dart';
import 'package:flutter_libraries_playground/movies/view/movies_list.dart';

void main() {
  configureInjector();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Libraries Playground',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MoviesList(),
      ),
    );
  }
}
