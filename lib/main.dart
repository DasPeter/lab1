import 'package:flutter/material.dart';
import 'package:lab1/pages/home_page.dart';
import 'package:lab1/pages/favorites.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song Finder',
      home: HomePage(),
      // theme: Theme.of(context),
    );
  }
}
