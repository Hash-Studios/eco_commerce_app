import 'package:eco_commerce_app/core/model/user.dart';
import 'package:eco_commerce_app/ui/widgets/imageSlider.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded;
  @override
  void initState() {
    super.initState();
    isLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: IconButton(
            onPressed: () {
              print("Nav Drawer");
            },
            color: Colors.black,
            icon: Icon(Icons.menu),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("Nav Drawer");
              },
              color: Colors.black,
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                print("Nav Drawer");
              },
              color: Colors.black,
              icon: Icon(Icons.bookmark),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[TrendingSlider()],
          ),
        ));
  }
}
