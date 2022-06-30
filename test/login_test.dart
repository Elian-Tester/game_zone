import 'package:gamezone/src/model/verificarCampos.dart';

import 'package:test/test.dart';

void main() {
  test('login email tipo email', () {
    expect(verificarEmail("elian@gmail.com"), true);
  });

  test('login email tipo no email', () {
    expect(verificarEmail("elian@gmail"), false);
  });

  //8-16, Mayus, minus y numero
  test('login contraseña longitud >8 y <16', () {
    expect(verificarPassword("yoNoSoy/77?"), true);
  });

  test('login contraseña longitud <8', () {
    expect(verificarPassword("Soy/7/"), false);
  });

  test('login contraseña longitud >16', () {
    expect(verificarPassword("SoyElBromas??//777xd"), false);
  });

  test('login contraseña sin numero', () {
    expect(verificarPassword("meFalta?numero"), false);
  });

  test('login contraseña sin mayuscula', () {
    expect(verificarPassword("mefalta?7??"), false);
  });

  test('login contraseña sin minuscula', () {
    expect(verificarPassword("NO?9687452?"), false);
  });

  test('login contraseña vacio', () {
    expect(verificarPassword(""), false);
  });
}




//mail = 25 , pass = 8-16 mayus,min, carcter y numero