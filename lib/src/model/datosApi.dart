import 'dart:convert';
import 'package:http/http.dart' as http;

class _datosAPi {
  List<Map> juegos = [];
  List<Map> juego = [];
  _datosAPi() {
    //_getGames();
    //getInfoGame();
  }

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

  Future<List<Map>> getGames() async {
    final url = Uri.parse('https://www.freetogame.com/api/games');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      print(jsonData.length);

      for (var item in jsonData) {
        //print(item['title']);

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
    } else {
      print("Error");
      return juegos;
      //throw Exception("error");
    }
  }

  Future<List<Map>> getInfoGame() async {
    print('info juego id');
    final url = Uri.parse('https://www.freetogame.com/api/game?id=60');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      Map juegoDato = {
        'id': jsonData["id"],
        'title': jsonData["title"],
        'thumbnail': jsonData["thumbnail"],
        'short_description': jsonData["short_description"],
        'genre': jsonData["genre"],
        'platform': jsonData["platform"]
      };

      print('server: $juegoDato');
      juego.add(juegoDato);

      return juego;
    } else {
      print("Error");
      return juego;
      //throw Exception("error");
    }
  }
}

final datosApi = new _datosAPi();
