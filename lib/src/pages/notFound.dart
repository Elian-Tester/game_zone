import 'package:flutter/material.dart';

class notFound extends StatefulWidget {
  notFound({Key? key}) : super(key: key);

  @override
  State<notFound> createState() => _gameInfoState();
}

class _gameInfoState extends State<notFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina no encontrada'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
