import 'package:flutter/material.dart';
import 'package:lab1/items/favorite.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        // backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        // color: Colors.blueGrey[900],
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Favorite();
          },
        ),
      ),
    );
  }
}
