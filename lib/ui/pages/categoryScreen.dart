import 'dart:convert';
import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/gradientBanner.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productGridTileDynamic.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

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
      Uri.parse('https://ecocommerce.herokuapp.com/categories'),
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
            .get(Uri.parse(
          'https://ecocommerce.herokuapp.com/categories/$categoryId'),
        )
            .then((http.Response res) {
          products = [];
          print(res.body);
          if (res.statusCode == 200) {
            for (int c = 0; c < json.decode(res.body)["products"].length; c++) {
              products.add(
                Product(
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
                  category: json.decode(res.body)["name"],
                  desc: json.decode(res.body)["products"][c]["desc"],
                  features: json.decode(res.body)["products"][c]["features"],
                  createdAt: json.decode(res.body)["products"][c]["createdAt"],
                ),
              );
            }
            if (this.mounted) {
              setState(() {
                isLoading = false;
              });
            }
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
          transitionOnUserGestures: true,
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
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: <Widget>[
          Hero(
            transitionOnUserGestures: true,
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
            isLoading
                ? LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xFF96EFA6)),
                    backgroundColor: Color(0x6696EFA6),
                  )
                : Column(
                    children: <Widget>[
                      GradientBanner(
                          gradient: config.Colors().nebula,
                          message:
                              "Find the greatest collection of $categoryName! All! Evertything!"),
                      Container(
                        decoration: BoxDecoration(
                          gradient: config.Colors().nebula,
                        ),
                        child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.58,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return ProductGridTileDynamic(
                                  arguements: [products[index]]);
                            }),
                      ),
                      GradientBanner(
                          gradient: config.Colors().nebula,
                          message: "Your quest for $categoryName ends here!"),
                      ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: products.length - 4,
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          itemBuilder: (context, index) {
                            return ProductListTileDynamic(
                                arguements: [products[index + 4]]);
                          }),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
