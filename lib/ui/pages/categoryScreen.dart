import 'dart:convert';

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
      //   _showSuccessSnackbar();
      //   globals.currentUser = CurrentUser(
      //     jwt: res["jwt"],
      //     confirmed: res["user"]["confirmed"].toString(),
      //     blocked: res["user"]["blocked"].toString(),
      //     id: res["user"]["id"],
      //     username: res["user"]["username"],
      //     email: res["user"]["email"],
      //     organisation: res["user"]["organisation"],
      //     orgemail: res["user"]["orgemail"],
      //     phone: res["user"]["phone"],
      //     createdAt: res["user"]["createdAt"],
      //   );
      //   globals.currentUser.saveUsertoSP();
      // } else {
      //   _showErrorSnackbar(res['message'][0]['messages'][0]['message']);
      // }
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
          children: <Widget>[
            SectionHeader(text: categoryName),
            isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductListTileDynamic(arguements: [
                        'https://ecocommerce.herokuapp.com' +
                            products[index]["images"][0]["url"],
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
