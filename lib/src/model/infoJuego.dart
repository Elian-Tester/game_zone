import 'dart:convert';
import 'package:http/http.dart' as http;

class _infoJuegoAPi {
  List<Map> juegos = [];
  //List<Map> juego = [];
  _infoJuegoAPi() {}

  /*
  detalles de un juego específico por id
  https://www.freetogame.com/api/game?id=1

  pide por plataaforma
  https://www.freetogame.com/api/games?platform=pc

  pide por genero
  https://www.freetogame.com/api/games?category=shooter

  pide por: release-date, popularity, alphabetical or relevance
  https://www.freetogame.com/api/games?sort-by=alphabetical
  */

  Future<List<Map>> getInfoGame(int id) async {
    List<Map> juego = [];
    print('info juego id');
    Map juegoDato = {};
    final url = Uri.parse('https://www.freetogame.com/api/game?id=$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

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

      //print('server: $juegoDato');
      juego.add(juegoDato);

      return juego;
    } else {
      print("Error");
      return juego;
      //throw Exception("error");
    }
  }
}

final infoJuego = new _infoJuegoAPi();
