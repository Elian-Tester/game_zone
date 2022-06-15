import 'package:flutter/material.dart';

//import 'package:gamezone/src/pages/home.dart';
import 'package:gamezone/src/pages/notFound.dart';
import 'package:gamezone/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* home: Center(
        //child: HomePage(),
        // child: listTemp(),
        
      ),
       */
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (BuildContext context) => notFound());
      },
    );
  }
}
