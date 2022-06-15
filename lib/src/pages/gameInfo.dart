import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gamezone/src/model/Agumentos.dart';
import 'package:gamezone/src/model/datosApi.dart';
import 'package:gamezone/src/model/infoJuego.dart';

class gameInfo extends StatefulWidget {
  gameInfo({Key? key}) : super(key: key);

  @override
  State<gameInfo> createState() => _gameInfoState();
}

class _gameInfoState extends State<gameInfo> {
  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as ArgInfoGame;
    //final Map argu = ModalRoute.of<Map>(context)!.settings.arguments;

    print('recibiendo Argumentos');
    print(argumentos.id);
    //String arg = argumentos.toString();

    //Map args = jsonDecode(arg);
    //print(args);

    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion game'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _pedirDatosJuego(argumentos.id),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  Widget _cardTipoInfo() {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('infos'),
            subtitle: Text(
                'Descripcion de juegos, plataformas, todos lo juegos son gratis asi que no importa el costo, ademas de que se tiene ñlla infoprmmacion de requisitos recomandadops para poder jugar cada titulo demas de una imagen del juego'),
            leading: Icon(
              Icons.image_rounded,
              color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Text('okey'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, primary: Colors.white),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Otros'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, primary: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoInfoImagen(Map argumentos) {
    final colorText = TextStyle(color: Colors.white, fontSize: 16.0);
    final colorTitle = TextStyle(color: Colors.white, fontSize: 25.0);

    final card = Container(
      //elevation: 13,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/quimica.gif'),
            image: NetworkImage(argumentos['thumbnail']),
            fadeInDuration: Duration(milliseconds: 200),
            height: 222.0,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(argumentos['title'], style: colorTitle),
            leading: Icon(
              Icons.computer,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(argumentos['description'], style: colorText),
            leading: Icon(
              Icons.games,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(argumentos['genre'], style: colorText),
            leading: Icon(
              Icons.games,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(argumentos['platform'], style: colorText),
            leading: Icon(
              Icons.games,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(argumentos['genre'], style: colorText),
            leading: Icon(
              Icons.games,
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(
              argumentos['minimum_system_requirements']['os'],
              style: colorText,
            ),
            leading: Icon(
              Icons.games,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }

  @override
  Widget _pedirDatosJuego(int id) {
    //pedir datos JSON
    print('pedir info juego');

    return FutureBuilder(
        future: infoJuego.getInfoGame(id),
        initialData: [],
        builder: (context, AsyncSnapshot snap) {
          print('builder pedorDatos info games');
          //print(snap.data);

          return Container(
            child: Column(
              children: recivirDatos(snap.data),
            ),
          );

          //return ListView(children: _crearItemsCorto(snap.data, context));
        });
  }

  List<Widget> recivirDatos(List data) {
    return data.map((item) {
      return Container(
        child: _cardTipoInfoImagen(item),
      );
    }).toList();
  }
}
