import 'package:gamezone/src/pages/signup.dart';
import 'package:test/test.dart';
import 'package:gamezone/src/pages/signup.dart';

void main() {
  test('signup nombre longitud', () {
    expect(validarCampoNombre(), "name");
  });

  test('signup email tipo email', () {
    expect(validarCampoEmail(), "email");
  });
  test('signup contraseña longitud', () {
    expect(validarCampoPassword(), "pass");
  });

  test('login contraseña mayuscula y munusculas', () {
    expect(validarCampoPassword(), "pass");
  });
}
