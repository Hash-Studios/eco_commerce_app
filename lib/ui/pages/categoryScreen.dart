import 'dart:convert';

import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:flutter/material.dart';
// import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;

class CategoryScreen extends StatefulWidget {
  final List<String> arguements;
  CategoryScreen({this.arguements});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String categoryName;
  String categoryId;
  List<dynamic> products;
  List<dynamic> res;
  bool isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void getData() async {
    setState(() {
      isLoading = true;
    });
    http
        .get(
      'https://ecocommerce.herokuapp.com/categories',
    )
        .then((http.Response response) {
      res = json.decode(response.body);
      // print(res);
      if (response.statusCode == 200) {
        for (int c = 0; c < res.length; c++) {
          if (res[c]["name"] ==
              categoryName.toLowerCase().replaceAll(" ", "_")) {
            categoryId = res[c]["id"];
          }
        }
        print(categoryId);
        http
            .get(
          'https://ecocommerce.herokuapp.com/categories/$categoryId',
        )
            .then((http.Response response) {
          products = json.decode(response.body)["products"];
          setState(() {
            isLoading = false;
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    categoryName = widget.arguements[0];
    getData();
  }

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Color(0xFFFFFFFF),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: SectionHeader(text: categoryName)),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    itemBuilder: (context, index) {
                      return ProductListTileDynamic(arguements: [
                        'assets/images/' +
                            // 'https://ecocommerce.herokuapp.com' +
                            // products[index]["images"][0]["url"],
                            products[index]["images"][0]["url"]
                                .toString()
                                .split("_")[0]
                                .toString()
                                .replaceAll("/uploads", "") +
                            ".jpg",
                        products[index]["name"],
                        products[index]["desc"],
                        products[index]["price"].toString(),
                      ]);
                    })
          ],
        ),
      ),
    );
  }
}
