import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Color(0xFFFFFFFF),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SectionHeader(text: 'Pens'),
            ProductListTile(),
            ProductListTile(),
            ProductListTile(),
            ProductListTile(),
            ProductListTile(),
            ProductListTile(),
          ],
        ),
      ),
    );
  }
}
