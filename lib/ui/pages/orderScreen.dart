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
import 'package:eco_commerce_app/main.dart' as main;

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isLoading = true;
  bool isLoaded;
  List<Product> products;
  List<Widget> orders = [];

  void getData() async {
    setState(() {
      isLoading = true;
    });
    String id = main.prefs.getString("id");
    // String jwt = main.prefs.getString("jwt");
    print(id);
    http
        .put(Uri.parse(
      'https://ecocommerce.herokuapp.com/users/$id'),
    )
        .then((http.Response res) {
      print(json.decode(res.body));
      products = [];
      if (res.statusCode == 200) {
        for (int c = 0; c < json.decode(res.body)["products"].length; c++) {
          products.add(
            Product(
              id: json.decode(res.body)["products"][c]["id"],
              name: json.decode(res.body)["products"][c]["name"],
              price: json.decode(res.body)["products"][c]["price"].toString(),
              images: new List<ProductImage>.generate(
                  jsonDecode(res.body)["products"][c]["images"].length,
                  (image) {
                return ProductImage(
                    id: jsonDecode(res.body)["products"][c]["images"][image]
                        ["id"],
                    name: jsonDecode(res.body)["products"][c]["images"][image]
                        ["name"],
                    ext: jsonDecode(res.body)["products"][c]["images"][image]
                        ["ext"],
                    size: jsonDecode(res.body)["products"][c]["images"][image]["size"]
                        .toString(),
                    width: jsonDecode(res.body)["products"][c]["images"][image]
                            ["width"]
                        .toString(),
                    height: jsonDecode(res.body)["products"][c]["images"][image]
                            ["height"]
                        .toString(),
                    url: jsonDecode(res.body)["products"][c]["images"][image]
                        ["url"],
                    thumbnailUrl: jsonDecode(res.body)["products"][c]["images"]
                        [image]["formats"]["thumbnail"]["url"],
                    smallUrl: jsonDecode(res.body)["products"][c]["images"]
                        [image]["formats"]["small"]["url"],
                    createdAt: jsonDecode(res.body)["products"][c]["images"]
                        [image]["createdAt"]);
              }),
              category: json.decode(res.body)["products"][c]["category"],
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
            title: AppBarTitle(text: "Orders"),
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
                            orders = [];
                            for (int index = 0;
                                index < products.length;
                                index++) {
                              orders.add(ProductListTileDynamic(
                                  arguements: [products[index]]));
                            }
                            return Column(children: orders);
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
