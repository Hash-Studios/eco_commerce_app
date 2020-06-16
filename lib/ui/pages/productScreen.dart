import 'package:eco_commerce_app/core/model/product.dart';
// import 'package:eco_commerce_app/ui/widgets/imageSlider.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productBadges.dart';
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
  bool popup;

  @override
  void initState() {
    fabVisible = false;
    popup = false;
    super.initState();
    product = widget.arguements[0];
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
                      setState(() {
                        popup = true;
                      });
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
                                setState(() {
                                  popup = true;
                                });
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
        popup
            ? Material(
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.8,
                          height: height * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                              colors: [Color(0xFF45B649), Color(0xFFDCE35B)],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.clear,
                                            color: Colors.white70),
                                        onPressed: () {
                                          setState(() {
                                            popup = false;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Order Details',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        31, 15.6, 31, 15.6),
                                    child: TextFormField(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Color(0xFFFFFFFF),
                                      cursorRadius: Radius.circular(8),
                                      cursorWidth: 1.8,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1),
                                        ),
                                        errorText: null,
                                        hintText: "Quantity",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                        labelText: "Quantity",
                                        labelStyle: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Qty';
                                        }

                                        return null;
                                      },
                                      onSaved: (String value) {
                                        //  _name = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        31, 15.6, 31, 15.6),
                                    child: TextFormField(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Color(0xFF000000),
                                      cursorRadius: Radius.circular(8),
                                      cursorWidth: 1.8,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1),
                                        ),
                                        errorText: null,
                                        hintText: "Offerable Price",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                        labelText: "Offerable Price",
                                        labelStyle: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Price Offered';
                                        }

                                        return null;
                                      },
                                      onSaved: (String value) {
                                        //   _name = value;
                                      },
                                    ),
                                  ),
                                  // ]),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        31, 15.6, 31, 15.6),
                                    child: TextFormField(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Color(0xFF000000),
                                      cursorRadius: Radius.circular(8),
                                      cursorWidth: 1.8,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1),
                                        ),
                                        errorText: null,
                                        hintText: "Expected Delivery Date",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                        labelText: "Expected Delivery Date",
                                        labelStyle: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Expected Date of Dilevery';
                                        }

                                        return null;
                                      },
                                      onSaved: (String value) {
                                        //  _name = value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        31, 15.6, 31, 15.6),
                                    child: TextFormField(
                                      minLines: 3,
                                      maxLines: 12,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                      textInputAction: TextInputAction.done,
                                      cursorColor: Color(0xFF000000),
                                      cursorRadius: Radius.circular(8),
                                      cursorWidth: 1.8,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1),
                                        ),
                                        errorText: null,
                                        hintText: "Any Special Requests",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                        labelText: "Any Special Requests",
                                        labelStyle: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Your Message';
                                        }

                                        return null;
                                      },
                                      onSaved: (String value) {
                                        //    _name = value;
                                      },
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Checkbox(
                                          value: true,
                                          onChanged: (val) {},
                                          activeColor: Colors.black26,
                                        ),
                                        Text(
                                            'I agree with the Terms and Conditions')
                                      ]),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 30, 10, 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 3),
                                                blurRadius: 10,
                                                color: Color(0xFF004445)
                                                    .withOpacity(0.2))
                                          ]),
                                      child: FlatButton(
                                        color: Color(0xFF004445),
                                        shape: StadiumBorder(),
                                        onPressed: () {
                                          setState(() {
                                            popup = false;
                                          });
                                        },
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container()
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
}
