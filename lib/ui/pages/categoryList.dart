import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';

class CategoryList extends StatefulWidget{
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool isLoaded;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //final String title;
  // final double price;
  // final String description;
  // final Image img;
  //_CategoryListState({this.title, this.price, this.description, this.img,});

  @override
  void initState() {
    super.initState();
    isLoaded = false;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
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
        

        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0,0,0,0),
                child: Text(
                  'Pen',
                  
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                   color: Colors.black,

                  ), 
                ),
              ),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
            ],
          ),
        ),
      ),
    );
  }
  


}