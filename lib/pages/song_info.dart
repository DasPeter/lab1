import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongInfoScreen extends StatelessWidget {
  const SongInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song info'),
        // backgroundColor: Colors.blueGrey[800],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (() {}),
              child: Icon(Icons.favorite),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        // color: Colors.blueGrey[900],
        child: Column(
          children: [
            Image.network(
                "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/rap-cd-album-mixtape-cover-design-template-8e67148b45c3625087dc1cb15f1de8a8_screen.jpg?ts=1629408333"),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                children: [
                  Text("Song Name",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      )),
                  Text("Album",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                  Text("Artist",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                  Text("Release date",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Divider(
                  // height: 1,
                  ),
            ),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text("Abrir con:")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: FaIcon(FontAwesomeIcons.spotify, size: 40)),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: FaIcon(FontAwesomeIcons.podcast, size: 40)),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: FaIcon(FontAwesomeIcons.apple, size: 40)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
