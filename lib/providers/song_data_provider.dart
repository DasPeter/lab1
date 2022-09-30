import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class SongDataProvider with ChangeNotifier {
  List<dynamic> _favoritesList = [];

  String statusMsg = "Toque para escuchar";
  bool animate = false;

  List<dynamic> get getFavoritesList => _favoritesList;

  Future<dynamic> identifySong() async {
    try {
      log("Started identifySong method");

      // TODO: 	indicar ruta (buscar que ruta usar)
      // TODO: 	encender glow
      // TODO: wait o delay de 4 segundos
      // TODO: detener grabacion
      // TODO: detener glow
      // TODO: enviar grabacion a API con http request
      // TODO: recibir response
      // TODO: leer response
      // TODO: Si es fallido, snackbar de intento fallido
      // TODO: si es reconocido, enviar datos a song_info
      // TODO:  desplegar en song_info
      notifyListeners();
    } catch (e) {
      _favoritesList = [];
      notifyListeners();
      print(e);
    }
  }
}
