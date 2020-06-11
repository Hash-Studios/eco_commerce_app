import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/pages/undefinedScreen.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/router.dart' as router;

import 'routing_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedScreen(
                name: settings.name,
              )),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeRoute,
    );
  }
}
