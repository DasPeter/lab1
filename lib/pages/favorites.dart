import 'package:flutter/material.dart';
import 'package:lab1/items/favorite.dart';
import 'package:lab1/pages/home_page.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.blueGrey[800],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.blueGrey[900],
        // child: Container(color: Colors.white),
        // child: usar listViewB,
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
