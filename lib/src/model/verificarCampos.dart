verificarEmail(email) {
  print("email: $email");

  var regExp = new RegExp(r"^[^@]+@[^@]+\.[a-zA-Z]{2,25}$");

  print("es tipo email= ${regExp.hasMatch(email)}");
  if (regExp.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}

verificarPassword(password) {
  print("pass: $password");
  var regExp = new RegExp(
      r"^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$");

  print("es tipo pass= ${regExp.hasMatch(password)}");
  if (regExp.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

verificarUserName(name) {
  print("name: $name");
  if (name.length > 4 && name.length < 15) {
    return true;
  } else {
    return false;
  }
}
