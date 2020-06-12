import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:eco_commerce_app/core/model/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/categoryButton.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:eco_commerce_app/ui/widgets/secondaryCategoryButton.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:eco_commerce_app/ui/widgets/textSlider.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  getUser() async {
    globals.currentUser = CurrentUser(
      jwt: await getStringFromSP('jwt'),
      id: await getStringFromSP('id'),
      confirmed: await getStringFromSP('confirmed'),
      blocked: await getStringFromSP('blocked'),
      username: await getStringFromSP('username'),
      email: await getStringFromSP('email'),
      organisation: await getStringFromSP('organisation'),
      orgemail: await getStringFromSP('orgemail'),
      phone: await getStringFromSP('phone'),
      createdAt: await getStringFromSP('createdAt'),
    );
  }

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
            Hero(
              tag: 'search',
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    print("Search");
                    Navigator.pushNamed(context, SearchRoute);
                  },
                  color: Colors.black,
                  icon: Icon(LineAwesomeIcons.search),
                ),
              ),
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
              Stack(
                children: <Widget>[
                  TrendingSlider(),
                  TextSlider(),
                ],
              ),
              SectionHeader(
                text: "Categories",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CategoryButton(
                    width: width,
                    text: "Cups",
                    image: "assets/icons/cup.png",
                    function: () {},
                  ),
                  CategoryButton(
                    width: width,
                    text: "Pens",
                    image: "assets/icons/pen.png",
                    function: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CategoryButton(
                    width: width,
                    text: "Plants",
                    image: "assets/icons/plant.png",
                    function: () {},
                  ),
                  CategoryButton(
                    width: width,
                    text: "Masks",
                    image: "assets/icons/mask.png",
                    function: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CategoryButton(
                    width: width,
                    text: "Paper",
                    image: "assets/icons/paper.png",
                    function: () {},
                  ),
                  SecondaryCategoryButton(
                    width: width,
                    text: "See All",
                    function: () {},
                  ),
                ],
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
