import 'package:flutter/material.dart';
import 'package:gamezone/src/component/icons_list.dart';
import 'package:gamezone/src/model/Agumentos.dart';
import 'package:gamezone/src/service/datosApi.dart';
import 'package:gamezone/src/pages/gameInfo.dart';

class listTemp extends StatelessWidget {
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

  @override
  Widget _pedirDatos() {
    return FutureBuilder(
        future: datosApi.getGames(),
        initialData: [],
        builder: (context, AsyncSnapshot snap) {
          return gridTarjetasJuegosMenu(snap, context);
        });
  }

  Widget gridTarjetasJuegosMenu(snap, context) {
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
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'infoGame',
              arguments: ArgInfoGame(item['id']));
        },
        child: tarjetaCargandoEspera(item),
      ),
    );
  }

  Widget tarjetaCargandoEspera(item) {
    return Container(
      child: FadeInImage(
        placeholder: AssetImage('assets/quimica.gif'),
        image: NetworkImage(item['thumbnail']),
        fadeInDuration: Duration(milliseconds: 200),
        fit: BoxFit.cover,
      ),
    );
  }
}
