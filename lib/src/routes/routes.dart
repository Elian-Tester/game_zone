import 'package:flutter/material.dart';

import 'package:gamezone/src/pages/gameInfo.dart';
import 'package:gamezone/src/pages/listas_temp.dart';
import 'package:gamezone/src/pages/login.dart';
import 'package:gamezone/src/pages/signup.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => login(),
    'infoGame': (BuildContext context) => gameInfo(),
    'signup': (BuildContext context) => signup(),
    'listTemp': (BuildContext context) => listTemp()
  };
}
