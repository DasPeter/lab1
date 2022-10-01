import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/song_data_provider.dart';

class SongInfoScreen extends StatelessWidget {
  final dynamic songData;
  bool isFavorite;
  String placeholderAlbum =
      "https://image.radioking.io/radios/460007/cover/custom/a2daa88f-05b2-408c-a554-57701ad526dc.png";

  SongInfoScreen({super.key, required this.songData, required this.isFavorite});

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
              child: Icon(Icons.favorite),
              onTap: (() {
                if (!isFavorite) {
                  // Here
                  context.read<SongDataProvider>().addFavorite(songData);
                } else {
                  // TODO: Delete favorite warning
                  context.read<SongDataProvider>().removeFavorite();
                }
                isFavorite = !isFavorite;
              }),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          // color: Colors.blueGrey[900],
          child: Column(
            children: [
              Image.network(
                  "${songData.containsKey("spotify") ? songData["spotify"]["album"]["images"][0]["url"] : placeholderAlbum}"),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${songData["title"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        )),
                    Text("${songData["album"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text("${songData["artist"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                    Text("${songData["release_date"]}",
                        textAlign: TextAlign.center,
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
                        icon: FaIcon(FontAwesomeIcons.spotify, size: 40),
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await launch(songData.containsKey("spotify")
                              ? songData["spotify"]["external_urls"]["spotify"]
                              : songData["song_link"]);
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.podcast, size: 40),
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await launch(songData.containsKey("deezer")
                              ? songData["deezer"]["link"]
                              : songData["song_link"]);
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.apple, size: 40),
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await launch(songData.containsKey("apple_music")
                              ? songData["apple_music"]["url"]
                              : songData["song_link"]);
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
