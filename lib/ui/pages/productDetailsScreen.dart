import 'package:eco_commerce_app/core/model/product.dart';
// import 'package:eco_commerce_app/ui/widgets/imageSlider.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/newImageSlider.dart';
import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  ProductDetailsScreen(this.product);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double width;
  double height;

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
              print("WishList-Search");
            },
            color: Colors.black,
            icon: Icon(LineAwesomeIcons.search),
          ),
          IconButton(
            onPressed: () {
              print("Bookmark");
            },
            color: Colors.black,
            icon: Icon(LineAwesomeIcons.bookmark),
          )
        ],
      ),
      backgroundColor: Color(0xFFFFFFFF),
      drawer: MainDrawer(),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: width * (5 / 6),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    NewImageSlider(
                      itemsList: [
                        widget.product.images[0].url,
                        widget.product.images[1].url,
                        widget.product.images[2].url,
                        widget.product.images[3].url
                      ],
                      showIndicator: true,
                      isAsset: false,
                      height: 400,
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.04,
                width: width,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(2),
                        width: width / 2,
                        child: ExpandText(
                          widget.product.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(1.0),
                      ),
                      Container(
                          margin: EdgeInsets.all(2),
                          width: width / 2,
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            children: <Widget>[
                              ExpandText(
                                widget.product.desc,
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ))
                    ],
                  ),
                  RaisedButton(
                    elevation: 4,
                    splashColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    onPressed: () {
                      print("Add to WishList");
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Icon(Icons.favorite_border),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text("Add to \nWishList"),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                height: 30,
                child: Text(
                  "Loved this product?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                width: width * 0.6,
                margin: EdgeInsets.only(top: 10, bottom: 4),
                child: RaisedButton(
                  elevation: 6,
                  onPressed: () {
                    print("Order now");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "ORDER NOW",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  color: Color(0xff004445),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: width * 0.4,
                    margin: EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Specifications",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.centerLeft,
                          child: ExpandText(
                            widget.product.features,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 4,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    height: 200,
                    width: width * 0.4,
                    margin: EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
//                    width: width * 2 / 4,
                    height: 20,
                    child: Text(
                      "Showing Similar Products",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
//                    width: width * 1 / 4,
                    height: 20,
                    child: InkWell(
                      onTap: () {
                        print("Show more similar");
                      },
                      child: Text(
                        "..more",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              ProductListTile(),
              ProductListTile(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getRatingBars() {
    List<Widget> ratingBar = new List();
    Color c;
    for (int i = 1; i <= 5; i++) {
      if (i == 1)
        c = Colors.green;
      else if (i == 2)
        c = Colors.green[600];
      else if (i == 3)
        c = Colors.green[300];
      else if (i == 4)
        c = Colors.yellow;
      else if (i == 5) c = Colors.deepOrange;

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
