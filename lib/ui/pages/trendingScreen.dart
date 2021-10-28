import 'dart:convert';
import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/ui/widgets/appBarTitle.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  bool isLoading = true;
  bool isLoaded;
  List<Product> products;
  List<Widget> trending = [];

  void getData() async {
    setState(() {
      isLoading = true;
    });
    http
        .get(
      Uri.parse('https://ecocommerce.herokuapp.com/products'),
    )
        .then((http.Response res) {
      print(json.decode(res.body));
      products = [];
      if (res.statusCode == 200) {
        for (int c = 0; c < json.decode(res.body).length; c++) {
          products.add(
            Product(
              id: json.decode(res.body)[c]["id"],
              name: json.decode(res.body)[c]["name"],
              price: json.decode(res.body)[c]["price"].toString(),
              images: new List<ProductImage>.generate(
                  jsonDecode(res.body)[c]["images"].length, (image) {
                return ProductImage(
                    id: jsonDecode(res.body)[c]["images"][image]["id"],
                    name: jsonDecode(res.body)[c]["images"][image]["name"],
                    ext: jsonDecode(res.body)[c]["images"][image]["ext"],
                    size: jsonDecode(res.body)[c]["images"][image]["size"]
                        .toString(),
                    width: jsonDecode(res.body)[c]["images"][image]["width"]
                        .toString(),
                    height: jsonDecode(res.body)[c]["images"][image]["height"]
                        .toString(),
                    url: jsonDecode(res.body)[c]["images"][image]["url"],
                    thumbnailUrl: jsonDecode(res.body)[c]["images"][image]
                        ["formats"]["thumbnail"]["url"],
                    smallUrl: jsonDecode(res.body)[c]["images"][image]
                        ["formats"]["small"]["url"],
                    createdAt: jsonDecode(res.body)[c]["images"][image]
                        ["createdAt"]);
              }),
              category: json.decode(res.body)[c]["category"],
              desc: json.decode(res.body)[c]["desc"],
              features: json.decode(res.body)[c]["features"],
              createdAt: json.decode(res.body)[c]["createdAt"],
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

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Consumer<CurrentUser>(
      builder: (_, currentUser, __) {
        currentUser.getUserfromSP();
        return Scaffold(
          appBar: AppBar(
            title: AppBarTitle(text: "Trending"),
            elevation: 0,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            leading: IconButton(
              icon: Icon(LineAwesomeIcons.arrow_left),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.white,
          drawer: MainDrawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                isLoading
                    ? LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xFF96EFA6)),
                        backgroundColor: Color(0x6696EFA6),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Builder(
                          builder: (context) {
                            trending = [];
                            for (int index = 0;
                                index < products.length;
                                index++) {
                              trending.add(ProductListTileDynamic(
                                  arguements: [products[index]]));
                            }
                            return Column(children: trending);
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
