import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Material App Bar'),
      // ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 80, 5, 30),
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Toque para escuchar",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 40),
              child: AvatarGlow(
                  endRadius: 200,
                  child: Container(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/images/waves5.gif"),
                      backgroundColor: Colors.white,
                    ),
                  )),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite,
                color: Colors.blueGrey[800],
              ),
            )
          ],
        ),
      ),
    );
  }
}
