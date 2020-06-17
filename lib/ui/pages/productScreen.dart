import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/ButtonBounceAnimation.dart';
// import 'package:eco_commerce_app/ui/widgets/imageSlider.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productBadges.dart';
import 'package:eco_commerce_app/ui/widgets/productCarousel.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProductScreen extends StatefulWidget {
  final List<Product> arguements;
  ProductScreen({this.arguements});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product product;
  bool fabVisible;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double width;
  double height;
  bool popup;
  bool isWishListed;
  String prefWishList;
  @override
  void initState() {
    fabVisible = false;
    popup = false;
    super.initState();
    product = widget.arguements[0];
    prefWishList = 'wishListPref';
    isWishListed = false;
    updateWishList(product.id, false);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
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
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonBounceAnimation(
                  child: Icon(
                      (!isWishListed)
                          ? LineAwesomeIcons.heart_o
                          : LineAwesomeIcons.heart,
                      color: (!isWishListed) ? Colors.black : Colors.red),
                  onTap: () {
                    print('heart');
                    setState(() {
                      updateWishList(product.id, true);
                      isWishListed = !isWishListed;
                    });
                  },
                  scale: 1,
                  duration: 300,
                  how: 1,
                  width: 40,
                  height: 40,
                ),
              )
            ],
          ),
          floatingActionButton: Visibility(
              visible: fabVisible,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF76ED92).withOpacity(0.4),
                        blurRadius: 16,
                        offset: Offset(0, 4)),
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xFF26A6B5), Color(0xFF96EFA6)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(500),
                ),
                child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, OrderConfirmRoute,
                          arguments: [product]);
                    }),
              )),
          backgroundColor: Color(0xFFFFFFFF),
          drawer: MainDrawer(),
          body: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        product.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Hero(
                        //   tag: product.name,
                        //   transitionOnUserGestures: true,
                        //   child:
                        ProductCarousel(
                          [
                            'assets/images' +
                                product.images[0].url
                                    .toString()
                                    .split("_")[0]
                                    .toString()
                                    .replaceAll("/uploads", "") +
                                ".jpg",

                            // product.images[1].url,
                            // product.images[2].url,
                            // product.images[3].url
                          ],
                          // ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.01,
                    width: width,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '₹',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF004445),
                              ),
                            ),
                            Text(
                              '${product.price}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 36,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF004445),
                              ),
                            ),
                            Text(
                              '/ per piece',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF004445),
                              ),
                            ),
                          ],
                        ),
                        VisibilityDetector(
                          key: ValueKey("BuyNow"),
                          onVisibilityChanged: (visibilityInfo) {
                            if (visibilityInfo.visibleFraction == 1) {
                              setState(() {
                                fabVisible = false;
                              });
                            } else if (visibilityInfo.visibleFraction == 0) {
                              if (this.mounted) {
                                setState(() {
                                  fabVisible = true;
                                });
                              }
                            } else {
                              if (this.mounted) {
                                setState(() {
                                  fabVisible = true;
                                });
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF76ED92).withOpacity(0.4),
                                    blurRadius: 16,
                                    offset: Offset(0, 4)),
                              ],
                              gradient: LinearGradient(
                                colors: [Color(0xFF26A6B5), Color(0xFF96EFA6)],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              colorBrightness: Brightness.dark,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(500)),
                              color: Colors.transparent,
                              onPressed: () {
                                Navigator.pushNamed(context, OrderConfirmRoute,
                                    arguments: [product]);
                              },
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Buy Now",
                                        textAlign: TextAlign.center,
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: height * 0.2, child: ProductBadges()),
                  Container(
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                      child: Text(
                        "Features",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          width: width * 0.9,
                          child: Column(
                            children: <Widget>[
                              ExpandText(
                                product.features,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context).textTheme.subtitle2,
                                maxLength: 8,
                                arrowSize: 30,
                              )
                            ],
                          ))
                    ],
                  ),
                  Container(
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                      child: Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          width: width * 0.9,
                          child: Column(
                            children: <Widget>[
                              ExpandText(
                                product.desc,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context).textTheme.subtitle2,
                                maxLength: 3,
                                arrowSize: 30,
                              )
                            ],
                          ))
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 30),
                  //   alignment: Alignment.centerLeft,
                  //   height: 30,
                  //   child: Text(
                  //     "Loved this product?",
                  //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Container(
                  //   height: 40,
                  //   width: width * 0.6,
                  //   margin: EdgeInsets.only(top: 10, bottom: 4),
                  //   child: RaisedButton(
                  //     elevation: 6,
                  //     onPressed: () {
                  //       print("Order now");
                  //     },
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: Text(
                  //       "ORDER NOW",
                  //       style: TextStyle(
                  //           fontFamily: "Poppins",
                  //           fontSize: 24,
                  //           color: Colors.white),
                  //     ),
                  //     color: Color(0xff004445),
                  //   ),
                  // ),
                  Container(
                    width: width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                            child: Text(
                              "Reviews",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width * 0.4,
                              height: 150,
                              margin: EdgeInsets.only(top: 10),
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  getRating(3.5),
                                  Text(
                                    'From 25,764 ratings',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: width * 0.4,
                              height: 150,
                              margin: EdgeInsets.only(top: 10),
                              color: Colors.transparent,
                              child: Column(
                                children: getRatingBars(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                      child: Text(
                        "Customers also bought",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  ProductListTile(),
                  ProductListTile(),
                  Container(
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                      child: Text(
                        "Similar to this product",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  ProductListTile(),
                  ProductListTile(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getRating(double rating) {
    Color c;
    if (rating < 1)
      c = Colors.red;
    else if (rating < 2)
      c = Colors.deepOrange;
    else if (rating < 3)
      c = Colors.yellow;
    else if (rating < 4)
      c = Colors.green[300];
    else if (rating < 5) c = Colors.green;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            rating.toString(),
            style: TextStyle(fontSize: 35, color: c),
          ),
        ),
        Icon(
          Icons.star,
          size: 30,
          color: c,
        ),
      ],
    );
  }

  List<Widget> getRatingBars() {
    List<Widget> ratingBar = new List();
    Color c;
    for (int i = 1; i <= 5; i++) {
      if (i == 1)
        c = Colors.green;
      else if (i == 2)
        c = Colors.green[300];
      else if (i == 3)
        c = Colors.yellow;
      else if (i == 4)
        c = Colors.deepOrange;
      else if (i == 5) c = Colors.red;

      ratingBar.add(new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              (6 - i).toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Icon(
            Icons.star,
            size: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 4,
              width: 4.00 * (26 - i * i),
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Text(
            (26 - i * i).toString(),
            style: TextStyle(fontSize: 14),
          )
        ],
      ));
    }
    return ratingBar;
  }

  updateWishList(String id, bool update) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishList =
        (prefs.getStringList(prefWishList) ?? List<String>());

    if (!update) {
      setState(() {
        wishList.contains(id) ? isWishListed = true : isWishListed = false;
      });
    } else {
      wishList.contains(id) ? wishList.remove(id) : wishList.add(id);
      await prefs.setStringList(prefWishList, wishList);
    }
  }
}
