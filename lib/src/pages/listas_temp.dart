import 'package:flutter/material.dart';
import 'package:gamezone/src/component/icons_list.dart';
import 'package:gamezone/src/model/Agumentos.dart';
import 'package:gamezone/src/model/datosApi.dart';
import 'package:gamezone/src/pages/gameInfo.dart';

class listTemp extends StatelessWidget {
  //const listTemp({Key? key}) : super(key: key);

  final datos = [
    'uno',
    'dos',
    'tres',
    'cuatro',
    'cinco',
    'seis',
  ];

  @override
  Widget build(BuildContext context) {
    final _style_text = TextStyle(fontSize: 25.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista origin',
          style: _style_text,
        ),
      ),
      body: _pedirDatos(),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (String dato in datos) {
      final widget_Temp = ListTile(
        title: Text(dato),
      );

      lista
        ..add(widget_Temp)
        ..add(Divider());
    }

    return lista;
  }

  @override
  Widget _pedirDatos() {
    //pedir datos JSON

    return FutureBuilder(
        future: datosApi.getGames(),
        initialData: [],
        builder: (context, AsyncSnapshot snap) {
          print('builder');
          //print(snap.data);

          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisExtent: 100),
            primary: false,
            padding: const EdgeInsets.all(15),
            children: _crearItemsCortoImagen(snap.data, context),
          );
          //return ListView(children: _crearItemsCorto(snap.data, context));
        });
  }

  List<Widget> _crearItemsCorto(List data, BuildContext context) {
    return data.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item['title'] + ''),
            subtitle: Text(item['genre']),
            //leading: Icon(Icons.account_box_rounded),
            leading: Image(image: NetworkImage(item['thumbnail'])),
            trailing: getIcon('arrow_>'),
            onTap: () {
              Navigator.pushNamed(context, 'infoGame',
                  arguments: {'data': item});
            },
          ),
          Divider(),
        ],
      );
    }).toList();
  }

  List<Widget> _crearItemsCortoImagen(List data, BuildContext context) {
    return data.map((item) {
      return Container(
        child: _cardTipoInfoImagen(item, context),
      );
    }).toList();
  }

  Widget _cardTipoInfoImagen(item, BuildContext context) {
    return Material(
      //elevation: 13,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: GestureDetector(
        onTap: () {
          print('id en list temp');
          print(item['id']);
          Navigator.pushNamed(context, 'infoGame',
              arguments: ArgInfoGame(item['id']));
        },
        child: Container(
          child: FadeInImage(
            placeholder: AssetImage('assets/quimica.gif'),
            image: NetworkImage(item['thumbnail']),
            fadeInDuration: Duration(milliseconds: 200),
            //height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    /*return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 0.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: card,
      ),
    );
    */
  }
}
