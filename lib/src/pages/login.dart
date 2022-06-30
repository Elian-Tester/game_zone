import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var height, width, size;
  String email_global = "";
  String pass_global = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Iniciar sesion"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          margin: EdgeInsets.only(
            left: 50.0,
            right: 50.0,
            //top: height * 0.25,
          ),
          child: scrollView(),
        ));
  }

  Widget scrollView() {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: SizedBox(
                  height: height * 0.7,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.25,
                      ),
                      etiquetaIzquierda("Email"),
                      campoTexto(0),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      etiquetaIzquierda("Password"),
                      campoTexto(1),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      botonIniciarSesion(),
                      Spacer(),
                      tienesCuenta()
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  Widget campoTexto(tipo) {
    var tipo_list = ["Email", "Password"];
    return TextFormField(
      onChanged: (textNombre) {
        print('${tipo_list[tipo]}: $textNombre');

        if (tipo == 0) {
          email_global = textNombre;
        }
        if (tipo == 1) {
          pass_global = textNombre;
        }
      },
      //style: TextStyle(fontSize: width * 0.043),
      validator: (value) {},
      decoration: InputDecoration(
          hintText: tipo_list[tipo],
          hintStyle: TextStyle(color: Colors.black26),
          //contentPadding: EdgeInsets.symmetric(horizontal: 10),

          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget etiquetaIzquierda(texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          texto,
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.043),
        )
      ],
    );
  }

  Widget botonIniciarSesion() {
    return ElevatedButton(
        onPressed: () {
          print("email: $email_global");
          print("pass: $pass_global");
          Navigator.pushNamed(context, "listTemp");
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.25, vertical: size.height * 0.02),
          primary: Colors.white,
          backgroundColor: Colors.black,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          "Iniciar sesion",
          style: TextStyle(fontSize: width * 0.04),
        ));
  }

  Widget tienesCuenta() {
    double fontSize = width * 0.043;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        etiquetaTexto("¿No tienes una cuenta?", fontSize, FontWeight.normal,
            Colors.black),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "signup");
            },
            child: etiquetaTexto(
                "Registrate ", fontSize, FontWeight.bold, Colors.red)),
      ],
    );
  }

  Widget etiquetaTexto(texto, fontSize, fontWeight, colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          texto,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: colors),
        )
      ],
    );
  }
}
