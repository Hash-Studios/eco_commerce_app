import 'package:eco_commerce_app/core/model/product.dart';
// import 'package:eco_commerce_app/ui/widgets/imageSlider.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/newImageSlider.dart';
import 'package:eco_commerce_app/ui/widgets/productCarousel.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
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

  @override
  void initState() {
    fabVisible = false;
    super.initState();
    product = widget.arguements[0];
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

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
          IconButton(
            onPressed: () {
              print("Bookmark");
            },
            color: Colors.black,
            icon: Icon(LineAwesomeIcons.bookmark),
          )
        ],
      ),
      floatingActionButton: Visibility(
          visible: fabVisible,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 10,
                      color: Color(0xFF004445).withOpacity(0.2))
                ]),
            child: FloatingActionButton(
                backgroundColor: Color(0xFF004445),
                child: Icon(Icons.shopping_cart),
                onPressed: () {}),
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
                    Hero(
                      tag: product.name,
                      transitionOnUserGestures: true,
                      child: ProductCarousel(
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
                      ),
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
                          setState(() {
                            fabVisible = true;
                          });
                        } else {
                          setState(() {
                            fabVisible = true;
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 10,
                                  color: Color(0xFF004445).withOpacity(0.2))
                            ]),
                        child: RaisedButton(
                          elevation: 0,
                          onPressed: () {
                            print("BUY NOW");
                          },
                          shape: StadiumBorder(),
                          child: Text(
                            "BUY NOW",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          color: Color(0xff004445),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                              Text('From 25,764 ratings')
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              (6 - i).toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Icon(
            Icons.star,
            size: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )),
          Text(
            (26 - i * i).toString(),
            style: TextStyle(fontSize: 15),
          )
        ],
      ));
    }
    return ratingBar;
  }
}
