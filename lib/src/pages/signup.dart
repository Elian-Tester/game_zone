import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var height, width, size;

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print('Valido');
      }
    }
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: titulo(),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: scrollView(),
      ),
    );
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
              child: formulario(),
            ),
          );
        },
      ),
    );
  }

  Widget titulo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Regístrate'),
      ],
    );
  }

  Widget logo() {
    return Hero(
      tag: "logo",
      child: Image.asset(
        'assets/B5.png',
        fit: BoxFit.contain,
        height: height / 15,
      ),
    );
  }

  Widget formulario() {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.07,
          top: height * 0.04,
          right: width * 0.07,
          bottom: height * 0.01),
      child: form(),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: height * 0.8,
        child: Column(
          children: [
            etiquetaTexto("Crea una cuenta para empezar a usar la app",
                width * 0.043, FontWeight.bold, Colors.black54),
            SizedBox(
              height: height * 0.058,
            ),
            etiquetaIzquierda("Nombre de usuario"),
            campoNombre(),
            SizedBox(
              height: height * 0.04,
            ),
            etiquetaIzquierda("Correo electrónico"),
            campoCorreo(),
            SizedBox(
              height: height * 0.04,
            ),
            etiquetaIzquierda("Contraseña"),
            campoPassword(1),
            SizedBox(
              height: height * 0.015,
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.05),
              child: etiquetaTexto(
                  "La contraseña debe contener caracteres, números y símbolos\ncon un minimo de 6 caracteres.",
                  width * 0.029,
                  FontWeight.normal,
                  Colors.black26),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              children: [
                checkBox(),
                terminosCondiciones(),
              ],
            ),
            SizedBox(
              height: height * 0.06,
            ),
            botonCrearCuenta(),
            Spacer(),
            Center(
              child: tienesCuenta(),
            ),
          ],
        ),
      ),
    );
  }

  Widget campoNombre() {
    return TextFormField(
      onChanged: (textNombre) {
        print('Campo nombre: $textNombre');
      },
      //style: TextStyle(fontSize: width * 0.043),
      validator: (value) {},
      decoration: InputDecoration(
          hintText: 'Nombre de usuario',
          hintStyle: TextStyle(color: Colors.black26),
          //contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget campoCorreo() {
    return TextFormField(
      //style: TextStyle(fontSize: width * 0.043),
      validator: (value) {},
      decoration: InputDecoration(
          hintText: 'Direccion de correo',
          hintStyle: TextStyle(color: Colors.black26),
          //contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget campoPassword(bandera) {
    return TextFormField(
      //style: TextStyle(fontSize: width * 0.043),
      validator: (value) {},
      decoration: InputDecoration(
          suffixIcon: bandera == 1 ? Icon(Icons.remove_red_eye) : SizedBox(),
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: Colors.black26),
          //contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: width * 0.015))),
    );
  }

  Widget botonCrearCuenta() {
    return ElevatedButton(
        onPressed: () {
          print(height);
          print(width);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.30, vertical: size.height * 0.02),
          primary: Colors.white,
          backgroundColor: Colors.green,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          "Crear Cuenta",
          style: TextStyle(fontSize: width * 0.04),
        ));
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

  Widget terminosCondiciones() {
    return Container(
      width: width * 0.7,
      alignment: Alignment.centerLeft,
      child: msjTerminosCondiciones(),
    );
  }

  Widget tienesCuenta() {
    double fontSize = width * 0.043;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        etiquetaTexto("¿Ya tienes una cuenta?", fontSize, FontWeight.normal,
            Colors.black),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'loginEmail');
            },
            child: etiquetaTexto(
                "Inicia sesión ", fontSize, FontWeight.bold, Colors.red)),
      ],
    );
  }

  Widget checkBox() {
    return Checkbox(
      shape: CircleBorder(),
      value: this.value,
      onChanged: (bool? value) {
        setState(() {
          this.value = value!;
        });
      },
    );
  }

  Widget msjTerminosCondiciones() {
    double fontSize = width * 0.04;
    List<TextSpan> textSpands = <TextSpan>[
      TextSpan(
          text: 'Al registrarme, acepto los ',
          style: TextStyle(color: Colors.black)),
      TextSpan(
          text: 'términos y condiciones ', style: TextStyle(color: Colors.red)),
      TextSpan(text: 'y la ', style: TextStyle(color: Colors.black)),
      TextSpan(
          text: 'politica de privacidad ', style: TextStyle(color: Colors.red)),
    ];
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: fontSize),
        children: textSpands,
      ),
    );
  }
}

validarCampoNombre() {
  return "name";
}

validarCampoEmail() {
  return "email";
}

validarCampoPassword() {
  return "pass";
}
