import 'dart:convert';

import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:eco_commerce_app/core/model/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/categoryButton.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productCardSlider.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
// import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:eco_commerce_app/ui/widgets/secondaryCategoryButton.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
// import 'package:eco_commerce_app/ui/widgets/textSlider.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/globals.dart' as globals;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isLoaded;
  List<dynamic> res;
  List<Widget> trending = [];
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

  void getData() async {
    setState(() {
      isLoading = true;
    });
    http
        .get(
      'https://ecocommerce.herokuapp.com/products',
    )
        .then((http.Response response) {
      res = json.decode(response.body);
      print(res);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    getUser();
    getData();
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
          leading: Hero(
            tag: 'menu',
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  print("Nav Drawer");
                  _scaffoldKey.currentState.openDrawer();
                },
                color: Colors.black,
                icon: Icon(LineAwesomeIcons.navicon),
              ),
            ),
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
            Hero(
              tag: 'bookmark',
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    print("Bookmark");
                  },
                  color: Colors.black,
                  icon: Icon(LineAwesomeIcons.bookmark),
                ),
              ),
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
              // Stack(
              // children: <Widget>[
              TrendingSlider(),
              // TextSlider(),
              // ],
              // ),
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
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: ["Cups"],
                      );
                    },
                  ),
                  CategoryButton(
                    width: width,
                    text: "Pens",
                    image: "assets/icons/pen.png",
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: ["Pens"],
                      );
                    },
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
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: ["Plants"],
                      );
                    },
                  ),
                  CategoryButton(
                    width: width,
                    text: "Masks",
                    image: "assets/icons/mask.png",
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: ["Masks"],
                      );
                    },
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
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: ["Paper"],
                      );
                    },
                  ),
                  SecondaryCategoryButton(
                    width: width,
                    text: "See All",
                    function: () {
                      Navigator.pushNamed(context, CategoriesRoute);
                    },
                  ),
                ],
              ),

              Center(child: SectionHeader(text: "Trending Products")),
              isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Builder(
                        builder: (context) {
                          for (int index = 0; index < res.length; index++) {
                            trending.add(ProductListTileDynamic(arguements: [
                              'assets/images/' +
                                  res[index]["images"][0]["url"]
                                      .toString()
                                      .split("_")[0]
                                      .toString()
                                      .replaceAll("/uploads", "") +
                                  ".jpg",
                              res[index]["name"],
                              res[index]["desc"],
                              res[index]["price"].toString(),
                            ]));
                          }
                          return Column(children: trending);
                        },
                      ),
                    ),
              SectionHeader(text: "Disposables"),
              ProductCardsSlider(),
            ],
          ),
        ));
  }
}
