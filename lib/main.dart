import 'package:eco_commerce_app/ui/pages/home.dart';
import 'package:eco_commerce_app/ui/pages/preSignUpSlider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PreSignUpSlider(),
    );
  }
}