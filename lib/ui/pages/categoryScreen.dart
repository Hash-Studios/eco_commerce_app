import 'dart:convert';
import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:flutter/material.dart';
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
  List<Product> products;
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
      if (response.statusCode == 200) {
        for (int c = 0; c < json.decode(response.body).length; c++) {
          if (json.decode(response.body)[c]["name"] ==
              categoryName.toLowerCase().replaceAll(" ", "_")) {
            categoryId = json.decode(response.body)[c]["id"];
          }
        }
        print(categoryId);
        http
            .get(
          'https://ecocommerce.herokuapp.com/categories/$categoryId',
        )
            .then((http.Response res) {
          products = [];
          print(res.body);
          if (res.statusCode == 200) {
            for (int c = 0; c < json.decode(res.body)["products"].length; c++) {
              products.add(Product(
                  id: json.decode(res.body)["products"][c]["id"],
                  name: json.decode(res.body)["products"][c]["name"],
                  price:
                      json.decode(res.body)["products"][c]["price"].toString(),
                  images: new List<ProductImage>.generate(
                      jsonDecode(res.body)["products"][c]["images"].length,
                      (image) {
                    return ProductImage(
                        id: jsonDecode(res.body)["products"][c]["images"][image]
                            ["id"],
                        name: jsonDecode(res.body)["products"][c]["images"]
                            [image]["name"],
                        ext: jsonDecode(res.body)["products"][c]["images"]
                            [image]["ext"],
                        size: jsonDecode(res.body)["products"][c]["images"][image]["size"]
                            .toString(),
                        width: jsonDecode(res.body)["products"][c]["images"][image]["width"]
                            .toString(),
                        height: jsonDecode(res.body)["products"][c]["images"]
                                [image]["height"]
                            .toString(),
                        url: jsonDecode(res.body)["products"][c]["images"]
                            [image]["url"],
                        thumbnailUrl: jsonDecode(res.body)["products"][c]
                            ["images"][image]["formats"]["thumbnail"]["url"],
                        smallUrl: jsonDecode(res.body)["products"][c]["images"]
                            [image]["formats"]["small"]["url"],
                        createdAt: jsonDecode(res.body)["products"][c]["images"][image]["createdAt"]);
                  }),
                  category: json.decode(res.body)["products"][c]["category"],
                  desc: json.decode(res.body)["products"][c]["desc"],
                  features: json.decode(res.body)["products"][c]["features"],
                  createdAt: json.decode(res.body)["products"][c]
                      ["createdAt"],),);
            }
            setState(() {
              isLoading = false;
            });
          }
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
                      return ProductListTileDynamic(
                          arguements: [products[index]]);
                    })
          ],
        ),
      ),
    );
  }
}
