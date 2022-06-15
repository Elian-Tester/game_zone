import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gamezone/src/model/dataGame.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _getGames();
  }

  Future<List<Map>> _getGames() async {
    final url = Uri.parse('https://www.freetogame.com/api/games');

    final response = await http.get(url);
    print("peticion hecha");
    List<Map> juegos = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      print(jsonData.length);

      print(jsonData[368]["id"]);
      print(jsonData[368]["title"]);
      print(jsonData[368]["thumbnail"]);
      print(jsonData[368]["genre"]);
      print(jsonData[368]["platform"]);

      for (var item in jsonData) {
        //print(item['title']);

        Map juego = {
          'id': item["id"],
          'title': item["title"],
          'thumbnail': item["thumbnail"],
          'genre': item["genre"],
          'platform': item["platform"]
        };

        juegos.add(juego);
      }
      print("juegos en map y list");
      print(juegos);
      return juegos;
    } else {
      print("Error");
      return juegos;
      //throw Exception("error");
    }
  }

  final _style_text = TextStyle(fontSize: 30.0);

  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juegos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lista',
              style: _style_text,
            ),
            Text(
              '$_contador',
              style: _style_text,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Hola musica');
          _contador++;
          print(_contador);
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
