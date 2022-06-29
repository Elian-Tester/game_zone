import 'dart:convert';
import 'package:http/http.dart' as http;

class _datosAPi {
  _datosAPi() {}

  Future<List<Map>> getGames() async {
    var url = Uri.parse('https://www.freetogame.com/api/games');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(body);

      return listaDatosJuegos(jsonData);
    } else {
      print("Error");

      return [
        {"": "", "": ""}
      ];
      //throw Exception("error");
    }
  }

  List<Map> listaDatosJuegos(jsonData) {
    List<Map> juegos = [];
    List<Map> juego = [];
    for (var item in jsonData) {
      Map juego = {
        'id': item["id"],
        'title': item["title"],
        'thumbnail': item["thumbnail"],
        'short_description': item["short_description"],
        'genre': item["genre"],
        'platform': item["platform"]
      };

      juegos.add(juego);
    }
    return juegos;
  }
}

class _infoJuegoAPi {
  List<Map> juegos = [];

  _infoJuegoAPi() {}

  Future<List<Map>> getInfoGame(int id) async {
    final url = Uri.parse('https://www.freetogame.com/api/game?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      return datosJuegoInfo(jsonData);
      ;
    } else {
      print("Error");
      return [
        {"": "", "": ""}
      ];
      //throw Exception("error");
    }
  }

  List<Map> datosJuegoInfo(jsonData) {
    Map juegoDato = {};
    juegoDato = {
      'id': jsonData["id"],
      'title': jsonData["title"],
      'thumbnail': jsonData["thumbnail"],
      'short_description': jsonData["short_description"],
      'genre': jsonData["genre"],
      'platform': jsonData["platform"],
      'description': jsonData["description"],
      'minimum_system_requirements': jsonData["minimum_system_requirements"]
    };
    return [juegoDato];
  }
}

final infoJuegoApi = new _infoJuegoAPi();
final datosApi = new _datosAPi();
