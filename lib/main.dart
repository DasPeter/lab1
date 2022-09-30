import 'package:flutter/material.dart';
import 'package:lab1/pages/home_page.dart';
import 'package:lab1/providers/song_data_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindTrackApp',
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        create: (context) => SongDataProvider(),
        child: HomePage(),
      ),
      // theme: Theme.of(context),
    );
  }
}
