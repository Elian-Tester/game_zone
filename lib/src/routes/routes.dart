import 'package:flutter/material.dart';

import 'package:gamezone/src/pages/gameInfo.dart';
import 'package:gamezone/src/pages/listas_temp.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => listTemp(),
    'infoGame': (BuildContext context) => gameInfo(),
  };
}
