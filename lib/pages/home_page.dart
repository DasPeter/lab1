import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lab1/pages/favorites.dart';
import 'package:lab1/pages/song_info.dart';
import 'package:lab1/providers/song_data_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animateGlow = false;

  String statusMsg = "Toque para escuchar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 80, 5, 30),
        // color: Colors.blueGrey[900],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(statusMsg,
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
                  animate: animateGlow,
                  child: GestureDetector(
                    onTap: () {
                      SnackBar snackBar;
                      doRecording().then((recordingPath) => {
                            // Call API to identify song
                            context
                                .read<SongDataProvider>()
                                .identifySong(recordingPath)
                                .then((response) => {
                                      if (response == null)
                                        {
                                          // Show snackbar if API couldn't be fetched
                                          log("API failed"),
                                          snackBar = SnackBar(
                                            content: const Text(
                                                "Lo sentimos, hubo un error. Intenta de nuevo."),
                                            // action: SnackBarAction(
                                            //   label: 'Aceptar',
                                            //   onPressed: () {
                                            //     ScaffoldMessenger.of(context)
                                            //         .hideCurrentSnackBar();
                                            //   },
                                            // ),
                                          ),
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar)
                                        }
                                      else
                                        {
                                          if (response["result"] == null)
                                            {
                                              // Show snackbar if no song matched
                                              log("No song matched"),
                                              snackBar = SnackBar(
                                                content: const Text(
                                                    "Lo sentimos, no encontramos esa canción.\nPuedes intentar de nuevo."),
                                                // action: SnackBarAction(
                                                //   label: 'Aceptar',
                                                //   onPressed: () {
                                                //     ScaffoldMessenger.of(
                                                //             context)
                                                //         .hideCurrentSnackBar();
                                                //   },
                                                // ),
                                              ),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar)
                                            }
                                          else
                                            {
                                              // Go to SongInfoScreen if a song matched
                                              log("Song matched"),
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SongInfoScreen(),
                                                ),
                                              )
                                            }
                                        }
                                    })
                          });
                    },
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/images/waves5.gif"),
                      backgroundColor: Colors.white,
                    ),
                  )),
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavoritesScreen(),
                  ),
                );
              },
              child: Icon(
                size: 30,
                Icons.favorite,
                color: Colors.blueGrey[600],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> doRecording() async {
    log("Tapped big button");

    // Update UI variables
    animateGlow = true;
    statusMsg = "Escuchando...";
    setState(() {});

    // Get temp folder route
    Directory appTempDir = await getTemporaryDirectory();
    log(appTempDir.path);

    // Record audio
    final myRecorder = Record();
    String? pathToRecording = "";

    // Check for recording permission
    if (await myRecorder.hasPermission()) {
      // Start recording
      myRecorder.start(path: "${appTempDir.path}/song_to_identify.m4a");
      log("Started recording");
    }

    // Wait 4 seconds to stop recording
    await Future.delayed(Duration(seconds: 4));
    pathToRecording = await myRecorder.stop();
    log("Stopped recording");
    log("pathToRecording:");
    log(pathToRecording!);

    // Update UI variables
    animateGlow = false;
    statusMsg = "Toque para escuchar";
    setState(() {});

    return pathToRecording;
  }
}
