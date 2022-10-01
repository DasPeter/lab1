import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final dynamic songData;
  const Favorite({super.key, this.songData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          // color: Colors.orange,
          ),
      child: MaterialButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const SongInfoScreen(),
          //   ),
          // );
          print("hey");
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/rap-cd-album-mixtape-cover-design-template-8e67148b45c3625087dc1cb15f1de8a8_screen.jpg?ts=1629408333"),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Icon(
                Icons.favorite,
                // color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(150, 33, 149, 243),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Column(
                  children: [
                    Text("Song Name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          // color: Colors.white,
                        )),
                    Text("Artist",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          fontWeight: FontWeight.w400,
                          // color: Colors.white,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
