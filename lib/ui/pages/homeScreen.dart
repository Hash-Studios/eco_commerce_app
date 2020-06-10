import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    isLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: IconButton(
            onPressed: () {
              print("Nav Drawer");
              _scaffoldKey.currentState.openDrawer();
            },
            color: Colors.black,
            icon: Icon(LineAwesomeIcons.navicon),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("Search");
              },
              color: Colors.black,
              icon: Icon(LineAwesomeIcons.search),
            ),
            IconButton(
              onPressed: () {
                print("Bookmark");
              },
              color: Colors.black,
              icon: Icon(LineAwesomeIcons.bookmark),
            )
          ],
        ),
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TrendingSlider(),
              SectionHeader(
                text: "Categories",
              ),
              SectionHeader(
                text: "Trending Products",
              ),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile()
            ],
          ),
        ));
  }
}
